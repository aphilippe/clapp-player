package externs;

import externs.Webview.WebRequestDetails;

@:jsRequire("@cliqz/adblocker", "Request")
extern class Request {
    public static function fromRawDetails(request:WebRequestDetails):Request;
}


@:jsRequire("@cliqz/adblocker", "FiltersEngine")
extern class FiltersEngine {
    public static function parse(filters:String): FiltersEngine;

    public function match(request:Request):MatchReturnValue;
}

extern typedef MatchReturnValue = {match:Bool}