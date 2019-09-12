function _smartdot -d 'Autocompletes "..." to "../.."'
    if [ (_smartdot_lookup) = '..' ]
        commandline -i -- '/..'
    else
        commandline -i -- '.'
    end
end
