listenBeforeRequest = (args) -> 
	console.log "##{args.requestId} #{args.method} #{args.url}"	

chrome.webRequest.onBeforeRequest.addListener listenBeforeRequest, {
	urls: ["http://*/*"]
}, null