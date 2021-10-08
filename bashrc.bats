load venv/lib/node_modules/bats-assert/load
load venv/lib/node_modules/bats-support/load
load .bashrc

@test "rm actually moves stuff to .Trash" {
  touch z.$$
  rm z.$$
  assert [ -f "$HOME"/.Trash/z.$$ ]
}

@test "expunge prompts before deleting" {
  touch "i have spaces.$$" && rm "i have spaces.$$"
  run expunge <<< "n"
  assert [ -f "$HOME/.Trash/i have spaces.$$" ]
  run expunge <<< "y"
  assert [ ! -f "$HOME/.Trash/i have spaces.$$" ]
  run expunge
  assert_success
}
