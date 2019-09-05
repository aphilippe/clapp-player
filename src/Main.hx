package;

import js.Browser;
import externs.Webview;
import externs.NW;
import session.service.SessionServiceFactory;

class Main {

    static function main()
    {
        var hotkeyManager = new hotkey.NWHotkeyManager();
        var sessionService = SessionServiceFactory.create();

        Browser.document.body.onload = function(_) {
            var webview:Webview = cast Browser.document.getElementById("mainwebview");
            
            webview.addEventListener("loadcommit", function(e) {
                if (e.isTopLevel)
                {
                    sessionService.setCurrentSessionUrl(e.url);
                }
            });
            
            var session = sessionService.CurrentSession;
            webview.src = session.url;

            var webviewAdBlocker = new WebviewAdBlocker(webview);
            webviewAdBlocker.start();

            var webviewConnector = new WebviewConnector(webview);            
            webviewConnector.start();

            hotkeyManager.registerHotkey("MediaPlayPause", webviewConnector.togglePlayPause);
            hotkeyManager.registerHotkey("MediaNextTrack", webviewConnector.next);
            hotkeyManager.registerHotkey("MediaPrevTrack", webviewConnector.previous);
            // hotkeyManager.registerHotkey("F11", webviewConnector.openDevTools);
        };

        var window = NWWindow.get();
        window.on("close", function() {
            hotkeyManager.unregisterAll();
            window.close(true);
        });
    }
}