" Vim syntax file
" Language: systemd-boot config file
" Maintainer: Henry Malinowski
" Latest Revision: 2018-01-12

" Obligatory
if exists("b:current_syntax")
    finish
endif

syntax clear
syntax case match

syntax match   systemdBootParamLinux /^linux/ 
syntax keyword systemdBootParamList title version machine-id initrd efi options devicetree
"syntax match   systemdBootUuid "[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}"
"syntax cluster systemdBootParams contains=@systemdBootLinux,@systemdBootParamList
syntax match   systemdBootUuid "[\x]{8}-[\x]{4}-[1-5][\x]{3}-[89ab][\x]{3}-[\x]{12}"


" Comment finding
" Comments are defined by systemd-boot specification as 'Lines beginning with '#' shall be ignored and used for commenting.'
syntax match   systemdBootComment  "^#.*"

" Hex color code 
let b:current_syntax = "systemd-boot-conf"

highlight link systemdBootParamList Define
highlight link systemdBootLinux     Define
highlight link systemdBootComment   Comment
highlight link systemdBootUuid Comment
"highlight link systemdBootParams    Define

