package externs.nw;

@:native("nw.Window")
extern class Window {
    public static function get():Window;
    public function on(key:String, callback:Void->Void):Void;
    public function close(forcing:Bool):Void;
}