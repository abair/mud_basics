function expectSequence(sequence, ordered)
  --[[ Listen for strings from the MUD, and send appropriate responses to each.

  This function starts an expect/respond cycle with the MUD.  The list of
  expected strings and their responses should usually be ordered in the
  sequence the MUD is expected to send them in.  See example below:
    sequence = {
      {"What's your name?", 'Mal'},
      {"What's your password?", 'Serenity'},
    }

  The above example would create a trigger that listens for 'What's your name?'
  and, when the trigger fires, sends 'Mal' and creates a new trigger listening
  for "What's your password?".  When the second trigger fires, the password
  ('Serenity') will be sent to the MUD.

  NOTE: Each expected string will only trigger once, and then the trigger
  object will be deleted.

  Arguments:
    sequence - A table of pairs of strings.  Each pair in the form of:
               {"expect string from mud", "respond to mud with string"}
    ordered - If true, only listen for one expect string at a time, in the
              order they appear in the sequence table.  If false, begin
              listening for all expected strings immediately.  (Default: true)

  TODO: Implement the ordered version.
  --]]
  local ordered = ordered or true

  -- TODO: This doesn't require the sequence to arrive in order.
  for _, pair in ipairs(sequence) do
    local expect = pair[1]
    local response = pair[2]
    tempTrigger(expect, function() send(response) end, 1)
  end
end
