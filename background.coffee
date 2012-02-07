listenBeforeRequest = (args) -> 
	

beforeNavigate = (args) -> 
	console.log "BeforeNavigate Tab", args
	if (args.frameId == 0)
		setTabInfo args

navigationCompleted = (args) -> 
	console.log "Navigation Completed Tab", args
	if (args.frameId == 0)
		setNavigationCompleted args


chrome.webRequest.onBeforeRequest.addListener listenBeforeRequest, {
	urls: ["http://*/*"]
}
chrome.webNavigation.onBeforeNavigate.addListener beforeNavigate
chrome.webNavigation.onCompleted.addListener navigationCompleted