renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    console.log tabInfo
    if tabInfo?
    	$("#url").text tabInfo.url
    	$("#loadTime").text tabInfo.totalResponseTime()