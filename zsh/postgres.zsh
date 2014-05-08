# Add Postgres.app binaries to $PATH
if [[ -s "/Applications/Postgres.app" ]]; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
fi
