var appList = ["Google Chrome", "Contexts", "Safari"]

for (var i in appList) {
    Application(appList[i]).quit()
}

delay(3)

for (var i in appList) {
    Application(appList[i]).activate()
}
