function gen-secret -a bytes --description "Generate a secret key"
   node -e "console.log(require('crypto').randomBytes($bytes).toString('base64'));"
end
