findTabInfo = (tabId, win) -> 
  win ?= window
  return win.headerbag[tabId]

setTabInfo = (args) -> 
    info = new TabInfo args
    window.headerbag[args.tabId] = info

getSelectedTab = (callback) -> 
  chrome.tabs.query(
    {windowId: chrome.windows.WINDOW_ID_CURRENT, active: true}, 
    (tabs) -> callback tabs[0])

setNavigationBegin = (tab) -> 
  tabInfo = findTabInfo tab.tabId
  if tabInfo?
    tabInfo.navigationBegin = tab.timestamp
  
setNavigationCompleted = (tab) -> 
  tabInfo = findTabInfo tab.tabId  
  tabInfo.timestampEnd = tab.timeStamp  
  text = Math.round(tabInfo.totalResponseTime()).toString()
  chrome.browserAction.setBadgeText { text: text, tabId: tab.tabId }  

registerRequest = (req) -> 
  if req.type == "main_frame"
    tabInfo = setTabInfo(req)
  else
    tabInfo = findTabInfo(req.tabId)  

  if tabInfo?
    tabInfo.requests[req.requestId] = req

findRequest = (req) -> 
  tabInfo = findTabInfo(req.tabId)
  if tabInfo? then tabInfo.requests[req.requestId] else null 

requestCompleted = (req) -> 
  reqStored = findRequest req  
  if reqStored?
    reqStored.timestampEnd = req.timestamp
    reqStored.ip = req.ip

class TabInfo
  @timestampEnd = null
  @navigationBegin = null
  @requests = []
  totalResponseTime: -> 
    Math.round @timestampEnd - @timestampBegin if @timestampEnd? 

  constructor: (tab) ->
    @timestampBegin = tab.timeStamp
    @url = tab.url
    @requests = []

window.headerbag = new Array()