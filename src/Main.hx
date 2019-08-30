package;

import js.Browser;
import externs.Webview;
import externs.NW;

class Main {

    static function main()
    {
        var hotkeyManager = new hotkey.NWHotkeyManager();

        Browser.document.body.onload = function(_) {
            var webview:Webview = cast Browser.document.getElementById("mainwebview");

            var webviewAdBlocker = new WebviewAdBlocker(webview);
            webviewAdBlocker.start();

            var webviewConnector = new WebviewConnector(webview);            
            webviewConnector.start();

            hotkeyManager.registerHotkey("MediaPlayPause", webviewConnector.togglePlayPause);
            hotkeyManager.registerHotkey("MediaNextTrack", webviewConnector.next);
            hotkeyManager.registerHotkey("MediaPrevTrack", webviewConnector.previous);
            hotkeyManager.registerHotkey("F11", webviewConnector.openDevTools);
        };

        var window = NWWindow.get();
        window.on("close", function() {
            hotkeyManager.unregisterAll();
            window.close(true);
        });
    }
}