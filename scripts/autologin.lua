function autoLogin(event, args, profile)
  --[[ A "smart" login function using triggers instead of timers.

  This function starts a challenge/response cycle once a connection is made.
  The list of strings and their responses should be saved in
  state.loginSequence.  Example:
    state.loginSequence = {
      {"What's your name?", 'Mal'},
      {"What's your password?", 'Serenity'},
    }

  Registered Event Handlers:
    sysConnectionEvent

  Arguments:
    event - String name of the event handler that triggered this function.
    args - Required for event hooks.  Args set by the event handler.
    profile - Required for event hooks.  Table of the current Mudlet profile.
  --]]
  if event == "sysConnectionEvent" then
    local loginSequence = state.loginSequence or nil
    if not loginSequence then
      msg = [[
Can't find login sequence.  Please set up a login sequence table.  Example:
  state.loginSequence = {
    {"What's your name?", 'Mal'},
    {"What's your password?", 'Serenity'},
  }
      ]]
      echo(msg)
      return
    end

    expectSequence(loginSequence)
  end
end
