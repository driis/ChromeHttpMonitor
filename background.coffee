listenBeforeRequest = (args) -> 
	console.log args


chrome.experimental.webRequest.onBeforeRequest.addListener listenBeforeRequest