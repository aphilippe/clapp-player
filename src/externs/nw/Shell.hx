package externs.nw;

@:native("nw.Shell")
extern class Shell {
    public static function openExternal(url:String):Void;
}