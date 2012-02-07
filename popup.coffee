renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    if tabInfo?
    	$("#url").text tab.url