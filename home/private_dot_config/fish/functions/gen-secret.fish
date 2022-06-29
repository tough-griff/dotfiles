function gen-secret -a bytes -d "Generate a secret key"
    test -n "$bytes" || set bytes 64
    node -p "require('crypto').randomBytes($bytes).toString('base64');"
end
