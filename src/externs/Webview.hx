package externs;

extern class Webview extends js.html.Element
{
    public var src(default, default):String;
    @:native("request") public var Request(default, null):WebRequest;
    public function executeScript(option:ExecuteScriptOption):Void;
    public function showDevTools(show:Bool):Void;    
}

extern typedef ExecuteScriptOption = {code:String, mainWorld:Bool}

extern class WebRequest
{
    public var onBeforeRequest:WebRequestEvent;
}

extern class WebRequestEvent
{
    public function addListener(fn:WebRequestDetails->WebRequestEventReturnValue, filter:WebRequestFilter, extraInfoSpec:Array<String>):Void;
}

extern class WebRequestDetails
{
    public var url(default, default):String;
}

extern typedef WebRequestEventReturnValue = 
{
    var cancel(default, default):Bool;
}

extern typedef WebRequestFilter = 
{
    public var urls(default, default):Array<String>;
}
