# Startup
clear
toilet --metal "1337 GEEK"

autoload colors ; colors

print "$fg[red]System Details"
sense

print "$fg[red]Today in history$fg[yellow]"
egrep -h "$(date +"%m/%d|%b* %d")" /usr/share/calendar/*

echo ""
