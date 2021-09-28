setup() {
  load venv/lib/node_modules/bats-assert/load
  load venv/lib/node_modules/bats-support/load
  . .bashrc
}

@test "is_in returns true when arg in args" {
  is_in a a b c
  assert_success
}

@test "rm actually moves stuff to .Trash" {
  touch z.$$
  rm z.$$
  assert [ -f "$HOME"/.Trash/z.$$ ]
}
