renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    console.log tabInfo
    if tabInfo?
    	$("#url").text tabInfo.url
    	$("#loadTime").text tabInfo.totalResponseTime()
    	mainRequest = tabInfo.getMainRequest()
    	if mainRequest?
    		$("#initialRequestTime").text mainRequest.totalResponseTime()
    		$("#hostIp").text mainRequest.ip
    	if tabInfo.requests?
    		$("#resources").text (Object.keys tabInfo.requests).length
    else
    	$("#notShown").text "This frame has content that is not supported."
    	$("#container").hide()
	
    return null