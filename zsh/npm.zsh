# Include npm completions
if test $(which npm); then
  . <(npm completion)
fi
