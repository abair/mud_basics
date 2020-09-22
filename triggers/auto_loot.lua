--[[ Automatically loot fallen souls.

Patterns:
    - '^\*> (.+) is DEAD! <\*$'
    - '^Your blood freezes as you hear( \w+)? (.*)'s death cry.$'

This trigger puts the 'auto' in 'autoloot'.  When any one of the trigger
strings is read, it will call the 'loot' function on your behalf.

Since the actual commands for looting vary from MUD to MUD, and even from one
character to the next on the same MUD, the actual loot code is stored as an
external function that is not part of MUD Basics.  Instead, define a function
named 'loot' that can be called with no arguments.  This function should
properly loot a body for your character.

Note: For convenience, MUD Basics has also defined an alias, named 'loot', that
calls the loot() function.
--]]
loot()  -- loot() is not part of the MUD Basics package.
