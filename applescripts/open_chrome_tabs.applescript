set myTabs to {"http://app.getsentry.com/", "http://app.ubervu.com/", "http://github.com/uberVU/thehole/issues/assigned/palcu?direction=desc&labels=&milestone=&page=1&sort=updated&state=open/", "https://mail.google.com/mail/u/1/?shva=1#inbox", "https://drive.google.com/a/ubervu.com/#folders/0BzycGIkC5P50TXBlcTZoRXZ5VUE"}
tell application "Google Chrome"
	activate
	repeat with i in myTabs
		open location i
	end repeat
end tell
