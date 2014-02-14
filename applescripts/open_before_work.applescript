set current_path to POSIX path of ((path to me as text) & "::")

-- get work apps
set appList to {}
set myApps to paragraphs of (read current_path & "apps.txt")
repeat with nextLine in myApps
	if length of nextLine is greater than 0 then
		copy (nextLine as string) to the end of appList
	end if
end repeat

-- open work apps
repeat with i in appList
	tell application i to activate
end repeat

-- run other scripts from folder
set scriptList to {"connect_tunnelblick", "open_vagrant", "open_chrome_tabs"}
repeat with i in scriptList
	run script current_path & i & ".applescript"
end repeat