# Provides abbr --add for completions, aliases for use in `eval`
abbr --add npmi 'npm install'
alias npmi 'npm install'
abbr --add npml 'npm ls --depth 0'
alias npml 'npm ls --depth 0'

abbr --add ne 'nodenv each -v'
abbr --add npmle 'nodenv each -v npm list -g --depth=0'

alias rrepl "env NODE_REPL_MODE=strict NODE_OPTIONS='--experimental-repl-await' rrepl"
