package hotkey;

interface IHotkeyManager
{
    public function registerHotkey(key:String, func:Void->Void):Void;
}