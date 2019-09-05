package externs;

@:jsRequire("fs")
extern class FS {
  static function readFileSync(path:String, encoding:String):String;
  static function existsSync(path:String):Bool;
  static function writeFileSync(path:String, data:String):Void;
}