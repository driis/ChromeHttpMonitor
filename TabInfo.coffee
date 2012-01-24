findTabInfo = (tabId, win) -> 
  win ?= window
  return win.headerbag[tabId]

setTabInfo = (args) -> 
    tabId = args.tabId
    info = new TabInfo tabId args.url
    window.headerbag[tabId] = info
  
class TabInfo
  @field Url
  @field TabId
  @field TotalResponseMs, default: 0
	
	constructor: (@tabId, @url) ->

window.headerbag = new Array()