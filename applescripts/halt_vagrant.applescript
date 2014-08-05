set close_vagrant to "z puppet; vagrant halt -f;"

-- close vagrant
tell application "iTerm"
	activate
	set myterm to (make new terminal)
	tell myterm
		launch session "Default"
		set mysession to current session
	end tell

	tell mysession
		write text close_vagrant
	end tell

	delay 5
end tell

-- quit iTerm
ignoring application responses
	tell application "iTerm"
		quit
	end tell
end ignoring

delay 2
tell application "System Events" to keystroke return
