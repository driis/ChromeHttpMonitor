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

setNavigationCompleted = (tab) -> 
  tabInfo = findTabInfo tab.tabId  
  tabInfo.timestampEnd = tab.timeStamp
  console.log tabInfo

class TabInfo
  @timestampEnd = null

  totalResponseTime: -> 
    @timestampEnd - @timestampBegin if @timestampEnd? 

  constructor: (tab) ->
    @timestampBegin = tab.timeStamp
    @url = tab.url

window.headerbag = new Array()