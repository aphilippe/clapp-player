package externs.nw;

@:native("nw.Shortcut")
extern class Shortcut
{
    public function new (option:{
        key:String,
        ?active:Void -> Void,
        ?failed:Void -> Void
    });
}