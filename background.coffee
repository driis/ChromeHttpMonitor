listenBeforeRequest = (args) -> 
	console.log "##{args.requestId} #{args.method} #{args.url}"	

chrome.experimental.webRequest.onBeforeRequest.addListener listenBeforeRequest, {
	urls: ["http://*/*"]
}, null