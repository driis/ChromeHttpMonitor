renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    console.log tabInfo
    if tabInfo?
    	urlLink = $ "#url"
    	urlLink.text tabInfo.url
    	urlLink.attr "href", tabInfo.url
    	urlLink.attr "alt", tabInfo.url    	
    	$("#loadTime").text tabInfo.totalResponseTime()
    	mainRequest = tabInfo.getMainRequest()
    	if mainRequest?
    		$("#initialRequestTime").text mainRequest.totalResponseTime()
    		$("#hostIp").text mainRequest.ip
    	if tabInfo.requests?
    		$("#resources").text (Object.keys tabInfo.requests).length
    else
    	$("#notShown").text "This frame has content that is not supported, or it was loaded while the extension was not running."
    	$("#container").hide()
	
    return null