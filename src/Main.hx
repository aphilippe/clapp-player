package;

import js.Browser;
import externs.Webview;
import externs.CliqzAdblocker.Request;
import externs.CliqzAdblocker.FiltersEngine;
import externs.Fs.FS;

class Main {
    static function main()
    {
        var engine = FiltersEngine.parse(FS.readFileSync("easylist.txt", "utf8"));

        Browser.document.body.onload = function(_) {
            var webview:Webview = cast Browser.document.getElementById("mainwebview");

            webview.Request.onBeforeRequest.addListener(function (request:WebRequestDetails) {
                var cliqzRequest = Request.fromRawDetails(request);

                return {cancel:engine.match(cliqzRequest).match};
            },
            {urls:["*://*/*"]},
            ["blocking"]);
        };
    }
}