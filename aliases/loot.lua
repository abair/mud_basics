--[[ Loot a dead body.

Patterns:
    - ^loot$

This alias calls the loot() function.

Since the actual commands for looting vary from MUD to MUD, and even from one
character to the next on the same MUD, the actual loot code is stored as an
external function that is not part of MUD Basics.  Instead, define a function
named 'loot' that can be called with no arguments.  This function should
properly loot a body for your character.

Note: For convenience, MUD Basics has also defined a trigger, named 'auto
loot', that calls the loot() function when something dies.
--]]
loot()  -- loot() is not part of the MUD Basics package.  Define your own.
