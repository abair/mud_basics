--[[ Easily eat and/or drink.

Pattern: ^chow ?(food|drink)$

`chow` with no arguments will eat and drink the items saved in eq.food and
eq.drink.  If you'd like to only eat or only drink, simply specify either
'food' or 'drink' as in `chow food`.

If you'd like to never eat or never drink, set either state.hungerless or
state.thirstless to true.
--]]
-- Import some library functions for speed and readability.
local fmt = string.format
local insert = table.insert

local food = eq.food or "bread"
local drink = eq.drink or "waterskin"
local hungerless = state.hungerless or false
local thirstless = state.thirstless or false
local mode = matches[2] or nil
local cmds = {}  -- The basic commands to eat and drink.
local items = {}  -- Required items such as eq.food or eq.drink.

if not hungerless and (not mode or mode == 'food') then
    insert(items, food)
    insert(cmds, fmt('eat %s', food))
end

if not thirstless and (not mode or mode == 'drink') then
    insert(items, drink)
    insert(cmds, fmt('drink %s', drink))
end

pack(items, 'unpack')
sendAll(unpack(cmds))
pack(items)
