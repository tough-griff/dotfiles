function rm-ds-store -d "Delete .DS_Store files"
    command find . -type f -name .DS_Store -delete
end
