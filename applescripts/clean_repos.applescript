set clean_repos to "/Users/alex/.homesick/repos/palcu/dotfiles/scripts/clean_repos.sh"

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
		write text clean_repos
	end tell
end tell
