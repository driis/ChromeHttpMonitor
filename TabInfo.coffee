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
  tabInfo.timeStampEnd = tab.timeStamp  
  text = tabInfo.totalResponseTime().toString()
  chrome.browserAction.setBadgeText { text: text, tabId: tab.tabId }  

registerRequest = (req) -> 
  if req.type == "main_frame"
    tabInfo = setTabInfo(req)
    tabInfo.mainRequest = req
  else
    tabInfo = findTabInfo(req.tabId)    
  if tabInfo?
    tabInfo.requests[req.requestId] = req
    req.totalResponseTime = () -> Math.round @timeStampEnd - @timeStamp

findRequest = (req) -> 
  tabInfo = findTabInfo(req.tabId)
  if tabInfo? then tabInfo.requests[req.requestId] else null 

requestCompleted = (req) -> 
  reqStored = findRequest req  
  if reqStored?
    reqStored.timeStampEnd = req.timeStamp
    reqStored.ip = req.ip

class TabInfo
  @timeStampEnd = null
  @navigationBegin = null
  @requests = []
  totalResponseTime: -> 
    Math.round @timeStampEnd - @timeStampBegin if @timeStampEnd? 
  
  getMainRequest: -> @mainRequest

  constructor: (tab) ->
    @timeStampBegin = tab.timeStamp
    @url = tab.url
    @requests = []

window.headerbag = new Array()