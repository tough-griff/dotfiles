function gen-secret -d "Generate a secret key" -a bytes
   node -e "console.log(require('crypto').randomBytes($bytes).toString('base64'));"
end
