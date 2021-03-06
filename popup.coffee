renderPopup = (tab, page) -> 
    tabInfo = findTabInfo tab.id, page
    console.log tabInfo
    if tabInfo?
    	renderDetails tabInfo
    	renderCookies tabInfo   
    	renderHeaders tabInfo 	   
    else
    	$("#notShown").text "This frame has content that is not supported, or it was loaded while the extension was not running."
    	$("#container").hide()
	
    return null

renderDetails = (tabInfo) -> 
	urlLink = $ "#url"
	urlLink.text tabInfo.url
	urlLink.attr "href", tabInfo.url
	urlLink.attr "alt", tabInfo.url    	
	responseTime = tabInfo.totalResponseTime()
	$("#loadTime").text responseTime.toString()
	mainRequest = tabInfo.getMainRequest()
	if mainRequest?
		$("#initialRequestTime").text mainRequest.totalResponseTime()
		$("#hostIp").text mainRequest.ip
	if tabInfo.requests?
		$("#resources").text (Object.keys tabInfo.requests).length

renderHeaders = (tabInfo) -> 
	if tabInfo.mainRequest? and tabInfo.mainRequest.headers?
		container = $ "#headers"
		addNameValue header, container for header in tabInfo.mainRequest.headers

renderCookies = (tabInfo) -> 
	chrome.cookies.getAll {url:tabInfo.url}, (cookies) -> 
		container = $ "#cookies"
		addNameValue cookie, container for cookie in cookies

addNameValue = (cookie,container) -> 
	name = cookie.name
	htmlLabel = "<label for='#{ name }'>#{name}:</label>"
	htmlTextBox = "<input name='#{name}' type='text' value='#{cookie.value}'/>"
	c = container.append htmlLabel, htmlTextBox

