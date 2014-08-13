set close_ubervu_vagrant to "cd ~/uberVU/puppet; vagrant halt -f;"
set close_hs_vagrant to "cd ~/hootsuite/dash-board; vagrant halt -f;"

-- close vagrant
tell application "iTerm"
	activate
	set myterm to (make new terminal)
	tell myterm
		launch session "Default"
		set mysession to current session
	end tell

	tell mysession
		write text close_ubervu_vagrant
		write text close_hs_vagrant
	end tell
end tell
