x;

var listenBeforeRequest;

listenBeforeRequest = function(args) {
  var x;
  return x = args;
};

chrome.experimental.webRequest.onBeforeRequest.addListener(listenBeforeRequest);
