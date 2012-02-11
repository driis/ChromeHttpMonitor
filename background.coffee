urlFilter = {
	urls: ["http://*/*", "https://*/*"]
}

beforeNavigate = (args) -> 
	console.log "BeforeNavigate Tab", args
	if (args.frameId == 0)
		setNavigationBegin args

navigationCompleted = (args) -> 
	console.log "Navigation Completed Tab", args
	if (args.frameId == 0)
		setNavigationCompleted args


chrome.webRequest.onBeforeRequest.addListener registerRequest, urlFilter
chrome.webRequest.onCompleted.addListener requestCompleted, urlFilter, ["responseHeaders"]
chrome.webNavigation.onBeforeNavigate.addListener beforeNavigate
chrome.webNavigation.onCompleted.addListener navigationCompleted