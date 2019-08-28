package;

import js.Browser;
import externs.Webview;

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
        };
    }

    
}