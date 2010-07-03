#!/bin/bash
#
# MàJ du fichier /etc/hosts d'AdZHosts (www.adzhosts.com).
# Par BoboTiG le 22 février 2010 (MàJ : 25 juin 2010)
#
#
# Usage : ./adzhosts-fr.sh
#
#
### Chronologie
#
# 25 juin 2010 :
#	- fixation de plusieurs coquilles (récupération du hostname, comparaison des versions, ...)
#	- ajout des bonnes permissions aux différents fichiers (644 pour /etc/hosts et /etc/hossts.or_$date)
# 23 juin 2010 :
#	- une ligne avec le nom d'hôte local (hostname) est automatiquement ajoutée pour résoudre les soucis de réseau
#	- ajout de l'option -y pour répondre oui à toutes les questions (mode automatique)
#	- si tu n'as pas assez de droits, je te demande le mot de passe root
# 12 juin 2010 :
#	- lors de la MàJ/création du fichier /etc/hosts, HOSTS.TXT est purgé pour prévenir des erreurs et mauvaises redirections
#	- si l'actuel /etc/hosts n'est pas d'AdZHosts, je ne peux pas connaître la version, du coup je demande pour la MàJ
#	- quand je wget HOSTS.TXT, je passe en mode silencieux (option -qq)
#
#
### Contributeurs
# 	+ fl4t des forum Korben.info
#

appending() {
	echo "[+] Purgation et création ..."
	cat HOSTS.txt | egrep "^# AdZHosts" > /etc/hosts
	chmod 644 /etc/hosts
	hostname=$(hostname)
	echo "127.0.0.1 localhost.localdomain localhost" ${hostname} >> /etc/hosts
	cat HOSTS.txt | egrep "^127.0.0.1" >> /etc/hosts
	cat HOSTS.txt | egrep "^255.255.255.255" >> /etc/hosts
}

updating() {
	if [ ${assume_yes} -eq 0 ]; then
		echo -n "[-] Faire une sauvegarde de /etc/hosts (o|N) ? "
		read backup
		case ${backup} in
			"o"|"O"|1)
				mv /etc/hosts /etc/hosts.or_${id}
				chmod 644 /etc/hosts.or_${id}
				echo "[+] Fichier de sauvegarde : /etc/hosts.or_"${id}
				;;
			*)
				mv /etc/hosts /tmp/hosts.tmp_${id}
				chmod 644 /tmp/hosts.tmp_${id}
				echo "[+] Fichier de sauvegarde temporaire : /tmp/hosts.tmp_"${id}
				;;
		esac
	else
		mv /etc/hosts /etc/hosts.or_${id}
		chmod 644 /etc/hosts.or_${id}
		echo "[+] Fichier de sauvegarde : /etc/hosts.or_"${id}
	fi
	appending
	rm -f "HOSTS.txt"
	echo "[!] Mission accomplie !"
}

if [ ${UID} -ne 0 ]; then
	echo "[!] Arf ! Tu n'as pas les droits root mec..." 
	su -c "./$0 $1"
else
	assume_yes=0
	if [ "$1" == "-y" ]; then
		assume_yes=1
	fi
	id=$(date +"%Y%m%d")
	link="http://kosvocore.free.fr/AdZHosts/HOSTS.txt"
	echo "[+] Téléchargement de l'archive d'AdZHosts..."
	wget -qq -U firefox -c ${link}
	if [ -e "HOSTS.txt" ]; then
		if [ -e /etc/hosts ]; then
			version=$(grep "^# AdZHosts v" /etc/hosts | cut -f2 -d"v")
			new_version=$(grep "^# AdZHosts v" HOSTS.txt | cut -f2 -d"v")
			if [ ${version} ] && [ "${version}" != "${new_version}" ]; then
				echo "[-] Version actuelle :" ${version}
				echo "[+] Nouvelle version :" ${new_version}
				updating
			elif ! [ ${version} ]; then
				echo "[!] Version actuelle de /etc/hosts indéfinie..."
				if [ ${assume_yes} -eq 0 ]; then
					echo -n "[+] Dois-je tout de même procéder à la MàJ (o|N) ? "
					read rep
					case ${rep} in
						"o"|"O"|1)
							updating
							echo "[-] Version actuelle :" ${version}
							;;
						*) echo "[!] /etc/hosts non mis à jour !" ;;
					esac
				else
					updating
				fi
			else
				echo "[+] /etc/hosts est déjà à jour !"
				echo "[-] Version actuelle :" ${version}
				rm -f "HOSTS.txt"
			fi
		else
			echo "[!] /etc/hosts est introuvable !"
			appending
			version=$(grep "^# AdZHosts v" /etc/hosts | cut -f2 -d"v")
			echo "[-] Version actuelle :" ${version}
		fi
	else
		echo "[!] Erreur lors de la récupération du fichier."
		echo "    URL :" ${link}
	fi
fi

