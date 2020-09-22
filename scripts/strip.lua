--[[ Remove leading and/or trailing whitespace from a string.

By default, remvoe leading AND trailing whitespace.

Arguments:
  mode - 'left' means remove leading whitespace
         'right' means remove trailing whitespace
         'all' means remove leading and trailing whitespace
         (default: 'all')

Return:
  The input string, with targeted whitespace removed
--]]
function string:strip(mode)
  local mode = mode or 'all'
  local stripped = nil

  local patterns = {
    left = '^/s*',  -- Leading whiespace (left-strip)
    right = '/s*$', -- Trailing whitespace (right-strip)
  }

  if mode == 'left' or mode == 'all' then
	  stripped = self:gsub(patterns['left'], '')
  end
  if mode == 'right' or mode == 'all' then
    stripped = self:gsub(patterns['right'], '')
  end

  return stripped
end
