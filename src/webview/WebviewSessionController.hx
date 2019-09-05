package webview;

import session.service.SessionService;

class WebviewSessionController
{
    private var _webview:externs.Webview;
    private var _service:SessionService;

    public function new(webview:externs.Webview, sessionService:SessionService)
    {
        _webview = webview;
        _service = sessionService;
    }

    public function start()
    {
        var session = _service.CurrentSession;
        _webview.src = session.url;

        _webview.addEventListener("loadcommit", function(e) {
            if (e.isTopLevel)
            {
                _service.setCurrentSessionUrl(e.url);
            }
        });
    }
}