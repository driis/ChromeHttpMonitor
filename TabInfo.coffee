findTabInfo = (tabId, win) -> 
  win ?= window
  return win.headerbag[tabId]

setTabInfo = (args) -> 
    tabId = args.tabId
    info = new TabInfo tabId, args.url
    window.headerbag[tabId] = info

getSelectedTab = (callback) -> 
  chrome.tabs.query(
    {windowId: chrome.windows.WINDOW_ID_CURRENT, active: true}, 
    (tabs) -> callback tabs[0])
  
class TabInfo
  totalResponseTime = 0
  constructor: (@tabId, @url) ->

window.headerbag = new Array()