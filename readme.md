ChromeHttpMonitor
===
ChromeHttpMonitor is a small and simple Chrome extension that lets you gauge the performance of the websites you visit. 


This it how it works:

Whenever Chrome finishes a page load, the time it took to load the page is displayed in the toolbar. This way it is always available when you need it, and you can easily ignore it on sites you don't care about. If you click the button, more details about the page is displayed.

Time to load is measured from initial request begin until the DOM content has been loaded.


Code
===
The extension is built with CoffeeScript. There are PowerShell scripts to build the code (make.ps1 - build once; watch.ps1 - monitors the source directory and builds your .coffee files whenever they change).
You will need to have CoffeeScript installed and on your path to build.


Future
===
More features are coming. Feel free to make feature requests (or even better, pull requests :-))