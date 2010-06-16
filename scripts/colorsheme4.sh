#!/usr/bin/env lua

local function cl(e)
    return ('\27[%sm'):format(e)
end

local function print_fg(bg, pre)
    for fg = 30,37 do
        fg = pre..fg
        io.write(cl(bg), cl(fg), (' %6s '):format(fg), cl(0))
    end
end

for bg = 40,47 do
    io.write(cl(0), ' ', bg, ' ')
    print_fg(bg, '')
    io.write('\n    ')
    print_fg(bg, '1;')
    print('\n')
end

-- Andres P
