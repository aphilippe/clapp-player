package session;

class Session 
{
    public var url(default, null): String;

    public function new(url:String)
    {
        this.url = url;
    }
}