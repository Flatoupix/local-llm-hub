Param()

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (Get-Command py -ErrorAction SilentlyContinue) {
  & py -3 "$ScriptDir\modelhub" install
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
  & python "$ScriptDir\modelhub" install
} else {
  throw "Python is required."
}
