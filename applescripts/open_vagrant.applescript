set open_vagrant to "z puppet; vagrant up;"
set update_master to "/Users/alex/.homesick/repos/palcu/dotfiles/scripts/update_master.sh;"

tell application "iTerm"
	activate
	try
		set mysession to current session of current terminal
	on error
		set myterm to (make new terminal)
		tell myterm
			launch session "Default"
			set mysession to current session
		end tell
	end try
	
	tell mysession
        write text update_master
		write text open_vagrant
	end tell
end tell
