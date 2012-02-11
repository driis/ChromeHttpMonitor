renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    console.log tabInfo
    if tabInfo?
    	$("#url").text tabInfo.url
    	$("#loadTime").text tabInfo.totalResponseTime()
    	mainRequest = tabInfo.getMainRequest()
    	if mainRequest?
    		console.log mainRequest
    		$("#initialRequestTime").text mainRequest.totalResponseTime()
    	if tabInfo.requests?
    		$("#resources").text (Object.keys tabInfo.requests).length
    else
    	$("#container").text("This tab was not loaded as a HTTP resource.")