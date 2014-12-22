set close_ubervu_vagrant to "cd ~/uberVU/puppet/hs_analytics_vagrant; vagrant halt -f;"

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
	end tell
end tell
