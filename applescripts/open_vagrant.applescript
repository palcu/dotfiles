set open_vagrant to "cd ~/uberVU/puppet && vagrant up"

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
		write text open_vagrant
	end tell
end tell
