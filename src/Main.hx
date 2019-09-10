package;

import js.Browser;
import externs.Webview;
import shell.service.ShellServiceFactory;
import session.service.SessionServiceFactory;
import window.service.WindowServiceFactory;
import webview.WebviewSessionController;


class Main {

    static function main()
    {
        var hotkeyManager = new hotkey.NWHotkeyManager();
        var sessionService = SessionServiceFactory.create();
        var shellService = ShellServiceFactory.create();

        Browser.document.body.onload = function(_) {
            var webview:Webview = cast Browser.document.getElementById("mainwebview");
            
            var webviewAdBlocker = new WebviewAdBlocker(webview);
            webviewAdBlocker.start();

            var webviewSessionController = new WebviewSessionController(webview, sessionService);
            webviewSessionController.start();            

            var webviewConnector = new WebviewConnector(webview);            
            webviewConnector.start();

            hotkeyManager.registerHotkey("MediaPlayPause", webviewConnector.togglePlayPause);
            hotkeyManager.registerHotkey("MediaNextTrack", webviewConnector.next);
            hotkeyManager.registerHotkey("MediaPrevTrack", webviewConnector.previous);
            // hotkeyManager.registerHotkey("F11", webviewConnector.openDevTools);


            webview.addEventListener("newwindow", function(e){
                shellService.openExternalUri(e.targetUrl);
            });
        };

        var windowService = WindowServiceFactory.create();
        windowService.getCurrentWindow().onClosed(function () {
            hotkeyManager.unregisterAll();
            return true;
        });
    }
}