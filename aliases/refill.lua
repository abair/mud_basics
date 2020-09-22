--[[ Easily refill your drink container from a drink source.

Pattern: ^refill (.*)$

This will refill eq.drink from the specified source.
--]]
-- Import some library functions for speed and readability.
local fmt = string.format
local insert = table.insert

local drink = eq.drink or "waterskin"
local source = matches[2]
local cmds = {}

insert(cmds, fmt('fill %s from %s', drink, source))

pack(drink, 'unpack')
sendAll(unpack(cmds))
pack(drink)
