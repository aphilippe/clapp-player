package externs;

@:native("nw")
extern class NW
{
    public static var App(default, null): NWApplication;
}

extern class NWApplication
{
    public function registerGlobalHotKey(shortcut:NWShortcut):Void;
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