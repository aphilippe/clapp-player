import externs.Webview;
import externs.CliqzAdblocker;
import externs.CliqzAdblocker.FiltersEngine;
import externs.Fs;

class WebviewAdBlocker
{
    private var _webview:Webview;
    private var _engine:FiltersEngine;

    public function new(webview:Webview)
    {
        _webview = webview;
    }

    public function start()
    {
        _engine = FiltersEngine.parse(FS.readFileSync("easylist.txt", "utf8"));

        _webview.Request.onBeforeRequest.addListener(function (request:WebRequestDetails) {
            var cliqzRequest = Request.fromRawDetails(request);

            return {cancel:_engine.match(cliqzRequest).match};
        },
        {urls:["*://*/*"]},
        ["blocking"]);
    }


}