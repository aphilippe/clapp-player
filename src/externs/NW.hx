package externs;

@:native("nw")
extern class NW
{
    public static var App(default, null): NWApplication;
    public static var Shell(default, null): NWShell;
}

extern class NWApplication
{
    public var dataPath(default, null):String;
    public function registerGlobalHotKey(shortcut:NWShortcut):Void;
    public function unregisterGlobalHotKey(shortcut:NWShortcut):Void;
}

extern class NWShell
{
    public function openExternal(url:String):Void;
}

@:native("nw.Shortcut")
extern class NWShortcut
{
    public function new(option:ShortcutOption);
}

extern typedef ShortcutOption = 
{
    key : String,
    active : Void->Void,
    failed :Void->Void
}

@:native("nw.Window")
extern class NWWindow 
{
    public static function get():NWWindow;
    public function on(key:String, callback:Void->Void):Void;
    public function close(forcing:Bool):Void ;
}
