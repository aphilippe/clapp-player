package externs.nw;

import externs.nw.Shortcut;

@:native("nw.App")
extern class App
{
    public static var dataPath(default, null):String;
    public static function registerGlobalHotKey(shortcut:Shortcut):Void;
    public static function unregisterGlobalHotKey(shortcut:Shortcut):Void;
}