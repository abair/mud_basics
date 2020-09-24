# MUD Basics Mudlet Module

This module works as a Mudlet package, but it is intended to provide a powerful
baseline that can be relied upon in all profiles, so it's best as a Module.

## Installation

1. Use Mudlet's Module Manager to install this module to your profile.  This
   can be done in any number of profiles to get the same functionality in each.
2. Connect to your MUD.
   When you connect for the first time, a function named mudBasicsConfig() will
   be run.  Follow the onscreen instructions to configure your profile to fully
   leverage MUD Basics.

## Profile Specific Options

Since MUD Basics is designed to be MUD **and** character agnostic, it does not
hold any functionality that isn't applicable to all characters on all MUDs.
     
One example of functionality that varies amongst MUDs is looting.  MUD Basics
has an Auto Loot trigger, since enabling automatic looting is something you'd
want on all MUDs, but it does not specify what actions are required to 'loot',
because that varies wildly depending on the MUD and character type.  Instead,
the Auto Loot trigger calls a function named 'loot()', and the user is expected
to define the loot() function in their profile.

Auto Login is another example.  MUD Basics will trigger a login sequence when
connecting to any MUD, but the exact series of MUD expected messages and
required user responses varies amongst characters.  Therefore, the autoLogin()
function in MUD Basics relies on a list of expected strings and their responses
that the user must define and save to the variable, state.loginSequence.

Below is a complete listing of MUD Basics functionality that relies on
per-profile configuration.

* autoLogin()
* Auto Loot
