listenBeforeRequest = (args) -> 
	console.log "##{args.requestId} #{args.type} #{args.method} #{args.url}"	

beforeNavigate = (args) -> 
	console.log "BeforeNavigate Tab #{args.tabId}, url = #{args.url}"
	setTabInfo args

navigationCompleted = (args) -> 
	console.log "Navigation Completed Tab #{args.tabId}"


chrome.webRequest.onBeforeRequest.addListener listenBeforeRequest, {
	urls: ["http://*/*"]
}

chrome.webNavigation.onBeforeNavigate.addListener beforeNavigate
chrome.webNavigation.onCompleted.addListener navigationCompleted