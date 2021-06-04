function gen-secret -a bytes -d "Generate a secret key"
    node -p "require('crypto').randomBytes($bytes).toString('base64');"
end
