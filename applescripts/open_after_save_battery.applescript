set current_path to POSIX path of ((path to me as text) & "::")

-- get battery apps
set appList to {}
set myApps to paragraphs of (read current_path & "battery_apps.txt")
repeat with nextLine in myApps
	if length of nextLine is greater than 0 then
		copy (nextLine as string) to the end of appList
	end if
end repeat

-- open battery apps
repeat with i in appList
	tell application i to activate
end repeat
