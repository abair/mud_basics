--[[ Easily put things in your backpack.

Arguments:
  items - Either a list-like table or a string.  The string(s) should be items
          to put/get into/out of the eq.pack.
  mode - A string choosing which operation to perofrm.
         'unpack' - Get items from the pack
         'check' - Do not move any items.  Open pack, look inside, close pack.
         nil - Put items into the pack.

Implementation Notes:
  - If your pack has a lid, set state.packHasLid to true.  If this value is false,
    then the open/close commands will be skipped.
--]]

function pack(items, mode)
  -- Localize some library functions for speed and readability.
  local fmt = string.format
  local insert = table.insert

  local pack = eq.pack or nil
  if not pack then
    echo('You have not pack to pack things into.\n')
    return
  end
  local packHasLid = state.packHasLid or false
  local cmds = {}  -- List of all commands required for this action
  local items = items or nil
  if not items and mode ~= 'check' then
    echo('Error: You must specify at least one item to pack or unpack.\n')
    return
  end
  if type(items) == type("") then  -- If items is a string instead of a list
    items = {items}
  end

  if mode == 'check ' then  -- Just looking inside the pack.
    insert(cmds, fmt('look in %s', pack))
  else
    local action = 'put'
    if mode == 'unpack' then  -- Removing items from pack instead of inserting
      action = 'get'
    end

    for _, item in ipairs(items) do
      insert(cmds, fmt('%s %s %s', action, item, pack))
    end
  end

  if packHasLid then  -- Make open the first cmd and close the final cmd.
    insert(cmd, 1, fmt('open %s', pack))
    insert(cmd, fmt('close %s', pack))
  end

  sendAll(unpack(cmds))
end
