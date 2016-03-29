if (( ${+commands[gwhoami]} )); then
  local gcmds
  local gcmd

  # Coreutils
  gcmds=('g[' 'gbase32' 'gbase64' 'gbasename' 'gcat' 'gchcon' 'gchgrp' 'gchmod'
    'gchown' 'gchroot' 'gcksum' 'gcomm' 'gcp' 'gcsplit' 'gcut' 'gdate' 'gdd'
    'gdf' 'gdir' 'gdircolors' 'gdirname' 'gdu' 'gecho' 'genv' 'gexpand' 'gexpr'
    'gfactor' 'gfalse' 'gfmt' 'gfold' 'ggroups' 'ghead' 'ghostid' 'gid'
    'ginstall' 'gjoin' 'gkill' 'glink' 'gln' 'glogname' 'gls' 'gmd5sum' 'gmkdir'
    'gmkfifo' 'gmknod' 'gmktemp' 'gmv' 'gnice' 'gnl' 'gnohup' 'gnproc' 'gnumfmt'
    'god''gpaste' 'gpathchk' 'gpinky' 'gpr' 'gprintenv' 'gprintf' 'gptx' 'gpwd'
    'greadlink' 'grealpath' 'grm' 'grmdir' 'gruncon' 'gseq' 'gsha1sum'
    'gsha224sum' 'gsha256sum' 'gsha384sum' 'gsha512sum' 'gshred' 'gshuf'
    'gsleep' 'gsort' 'gsplit' 'gstat' 'gstdbuf' 'gstty' 'gsum' 'gsync' 'gtac'
    'gtail' 'gtee' 'gtest' 'gtimeout' 'gtouch' 'gtr' 'gtrue' 'gtruncate'
    'gtsort' 'gtty' 'guname' 'gunexpand' 'guniq' 'gunlink' 'guptime' 'gusers'
    'gvdir' 'gwc' 'gwho' 'gwhoami' 'gyes')

  # Binutils
  gcmds+=('gaddr2line' 'gar' 'gc++filt' 'gcoffdump' 'gdlltool' 'gdllwrap'
    'gelfedit' 'gnlmconv' 'gnm' 'gobjcopy' 'gobjdump' 'granlib' 'greadelf'
    'gsize' 'gsrconv' 'gstrings' 'gstrip' 'gsysdump' 'gwindmc' 'gwindres')

  # Findutils
  gcmds+=('gfind' 'glocate' 'gupdatedb' 'gxargs')

  # Libtool
  gcmds+=('glibtool' 'glibtoolize')

  # Miscellaneous
  gcmds+=('gawk' 'gsed' 'gtar')

  # Wrap GNU utilities in functions.
  for gcmd in "${gcmds[@]}"; do
    (( ${+commands[${gcmd}]} )) &&
      eval "function ${gcmd[2,-1]} { '${commands[${gcmd}]}' \"\$@\" }"
  done
fi
