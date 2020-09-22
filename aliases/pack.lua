--[[ Easily put things in your backpack.

Pattern: ^(check |un)?pack(.*)

pack   - open your pack (eq.pack), put the item(s) in it, then close it.
unpack - open, retrieve the item(s), then close.
check  - will open, look inside, then close.

Multiple items can be specified via a comma separated list.  All items will be
retrieved with only one set of open/close commands.
--]]

local mode = matches[2]
local items = matches[3]
local sep = ','  -- The delimiter for splitting up the list of items.

items = items:split(sep)
-- Remove leading/trailing whitespace from each item.
for i, item in ipairs(table) do
  items[i] = item:strip()
end

if mode == 'un' then
  mode = 'unpack'
end

pack(items, mode)
