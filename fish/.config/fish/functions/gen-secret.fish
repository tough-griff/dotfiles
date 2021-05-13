function gen-secret -a bytes -d "Generate a secret key"
    node -e "console.log(require('crypto').randomBytes($bytes).toString('base64'));"
end
