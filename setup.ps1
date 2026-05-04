Param()

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (Get-Command py -ErrorAction SilentlyContinue) {
  & py -3 "$ScriptDir\modelhub" setup
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
  & python "$ScriptDir\modelhub" setup
} else {
  throw "Python is required."
}
