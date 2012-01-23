var listenBeforeRequest;

listenBeforeRequest = function(args) {
  return console.log(args);
};

chrome.experimental.webRequest.onBeforeRequest.addListener(listenBeforeRequest);
