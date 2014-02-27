set current_path to POSIX path of ((path to me as text) & "::")

-- get work apps
set appList to {}
set myApps to paragraphs of (read current_path & "apps.txt")
repeat with nextLine in myApps
	if length of nextLine is greater than 0 then
		copy (nextLine as string) to the end of appList
	end if
end repeat

-- close work apps
repeat with i in appList
	tell application i
		quit
	end tell
end repeat

-- run other scripts from folder
set scriptList to {"clean_repos", "halt_vagrant"}
repeat with i in scriptList
	run script current_path & i & ".applescript"
end repeat
