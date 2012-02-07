listenBeforeRequest = (args) -> 
	console.log "Request begin ##{args.requestId}", args

beforeNavigate = (args) -> 
	console.log "BeforeNavigate Tab", args
	setTabInfo args

navigationCompleted = (args) -> 
	console.log "Navigation Completed Tab", args
	setNavigationCompleted args


chrome.webRequest.onBeforeRequest.addListener listenBeforeRequest, {
	urls: ["http://*/*"]
}
chrome.webNavigation.onBeforeNavigate.addListener beforeNavigate
chrome.webNavigation.onCompleted.addListener navigationCompleted