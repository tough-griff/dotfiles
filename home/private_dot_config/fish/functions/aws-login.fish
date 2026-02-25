function aws-login -w aws -d "Log in to AWS using SSO and export credentials"
    aws sso login $argv
    eval "$(aws configure export-credentials $argv --format fish)"
end
