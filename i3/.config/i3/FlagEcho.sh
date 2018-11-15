#!/bin/sh
usage()
{
  echo "Usage: $0 {ISO 3166-2 Country Code}" 1>&2
}

help()
{
  usage
  echo "-h --help Display this message."
  echo "-v --version Display version information."
}

about()
{
  echo "FlagEcho 0.1"
  echo "Copyright (C) 2018 Henry Malinowski"
}

if [ "$#" -eq 0 ]; then
  echo "Country code absent." 1>&2
  usage
  exit 1
elif [ "$#" -gt 1 ]; then
  echo "Country code abundence." 1>&2
  usage
  exit 1
fi

kb_layout=$1
kb_code_len=${#kb_layout}

# 2 Character matching here
if [ $kb_code_len -eq 2 ]; then
  # A perfect hashtable would make this crazy fast. Maybe rust can do it. 🤷‍♂️
  # These keyboard code should correspond to ISO 3166-2 country codes
  # not all flags are included; just the ones that I saw setxkbmap accepting.
  kb_flag=$(case $kb_layout in
    "af") echo "🇦🇫" ;; # Afghani flag
    "al") echo "🇦🇱" ;; # Albanian flag
    "am") echo "🇦🇲" ;; # Armenian flag
    "au") echo "🇦🇺" ;; # Austrailian flag
    "ba") echo "🇧🇦" ;; # Bosnian / Herzegovian flag
    "bd") echo "🇧🇩" ;; # Bangladeshi flag
    "be") echo "🇧🇪" ;; # Belgian flag
    "bg") echo "🇧🇬" ;; # Bulgarian flag
    "br") echo "🇧🇷" ;; # Brazilian flag
    "bt") echo "🇧🇹" ;; # Bhutani flag
    "bw") echo "🇧🇼" ;; # Botswanian flag
    "by") echo "🇧🇾" ;; # Belarussian flag
    "ca") echo "🇨🇦" ;; # Canadian flag
    "cd") echo "🇨🇩" ;; # DRC flag
    "ch") echo "🇨🇭" ;; # Swiss flag
    "cm") echo "🇨🇲" ;; # Cameroonian flag
    "cn") echo "🇨🇳" ;; # Chi:nese flag
    "cz") echo "🇨🇿" ;; # Czechian flag
    "de") echo "🇩🇪" ;; # German flag
    "dz") echo "🇩🇿" ;; # Algerian flag
    "ee") echo "🇪🇪" ;; # Estonian flag
    "es") echo "🇪🇸" ;; # Spanish flag
    "et") echo "🇪🇹" ;; # Ethiopian flag
    "eu") echo "🇪🇺" ;; # European Union flag
    "fi") echo "🇫🇮" ;; # Finish flag
    "fo") echo "🇫🇴" ;; # Faroese flag
    "fr") echo "🇫🇷" ;; # French flag
    "gb") echo "🇬🇧" ;; # Great British flag
    "ge") echo "🇬🇪" ;; # Georgian flag
    "gh") echo "🇬🇭" ;; # Ghanan flag
    "gn") echo "🇬🇳" ;; # Guinean flag
    "gr") echo "🇬🇷" ;; # Greek flag
    "hr") echo "🇭🇷" ;; # Croatian flag
    "hu") echo "🇭🇺" ;; # Hungarian flag
    "id") echo "🇮🇩" ;; # Indonesian flag
    "ie") echo "🇮🇪" ;; # Irish flag
    "il") echo "🇮🇱" ;; # Israeli flag
    "in") echo "🇮🇳" ;; # Indian flag
    "iq") echo "🇮🇶" ;; # Iraqi flag
    "ir") echo "🇮🇷" ;; # Iranian flag
    "jp") echo "🇯🇵" ;; # Japanese flag
    "lk") echo "🇱🇰" ;; # Shi Lankan flag
    "lt") echo "🇱🇹" ;; # Lithuanian flag
    "lv") echo "🇱🇻" ;; # Latvian flag
    "ma") echo "🇲🇦" ;; # Maroccan flag
    "mf") echo "🇫🇷" ;; # Saint-Martinois flag (French overseas collectivity)
    "md") echo "🇲🇩" ;; # Moldovan flag
    "me") echo "🇲🇪" ;; # Montenegrin flag
    "ph") echo "🇵🇭" ;; # Philippine flag
    "pk") echo "🇵🇰" ;; # Pakistani flag
    "pl") echo "🇵🇱" ;; # Polish flag
    "pt") echo "🇵🇹" ;; # Portugese flag
    "ro") echo "🇷🇴" ;; # Romanian flag
    "rs") echo "🇷🇸" ;; # Serbian flag
    "ru") echo "🇷🇺" ;; # Russian flag
    "se") echo "🇸🇪" ;; # Swedish flag
    "si") echo "🇸🇮" ;; # Slovenian flag
    "sk") echo "🇸🇰" ;; # Slovakian flag
    "sn") echo "🇸🇳" ;; # Senegalese flag
    "us") echo "🇺🇸" ;; # American Flag
    *) echo "Flag not found" && exit 2 ;;
  esac)
fi

echo "$kb_flag"
