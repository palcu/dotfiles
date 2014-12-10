set myTabs to {"https://github.com/search?utf8=%E2%9C%93&q=assignee%3Apalcu+state%3Aopen&type=Issues&ref=searchresults", "https://mail.google.com/mail/u/1/?shva=1#inbox", "https://drive.google.com/a/hootsuite.com/#folders/0BwuFsHJDxJWPYmxXQ1VQVlN6T2M"}
tell application "Google Chrome"
	activate
	repeat with i in myTabs
		open location i
	end repeat
end tell
