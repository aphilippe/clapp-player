package externs;

extern class Webview
{
    public var src(default, default):String;
    @:native("request") public var Request(default, null):WebviewRequest;
}

extern class WebviewRequest
{
    public var onBeforeRequest:WebviewRequestListenerCollection;
}

extern class WebviewRequestListenerCollection
{
    public function addListener(fn:RequestB->{cancel:Bool}, filter:{urls:Array<String>}, plop:Array<String>):Void;
}

extern class RequestB
{
    public var url:String;
}