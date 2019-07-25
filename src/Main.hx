package;

import js.Browser;
import externs.Webview;

class Main {
    static function main()
    {
        Browser.document.body.onload = function(_) {
            var webview:Webview = cast Browser.document.getElementById("mainwebview");
        
            webview.src = "http://www.google.com";
        };
    }
}