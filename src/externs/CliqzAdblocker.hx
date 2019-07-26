package externs;

import externs.Webview.RequestB;

@:jsRequire("@cliqz/adblocker", "Request")
extern class Request {
    public static function fromRawDetails(request:RequestB):Request;
}


@:jsRequire("@cliqz/adblocker", "FiltersEngine")
extern class FiltersEngine {
    public static function parse(filters:String): FiltersEngine;

    public function match(request:Request):{match:Bool};
}