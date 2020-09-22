--[[ This file is run when the Mud Basics module is loaded.

It's mostly used for bootstrapping some tables used by the Module.
--]]
state = state or {}  -- Used to synchronize state information amongst objects
eq = eq or {}  -- Used to store character equipment and item information

state.loginSequence = state.loginSequence or {}
