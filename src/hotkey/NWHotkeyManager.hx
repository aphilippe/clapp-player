package hotkey;

class NWHotkeyManager implements IHotkeyManager
{
    public function new() {}

    public function registerHotkey(key:String, func:Void->Void)
    {
        var option = {
            key: key,
            active: func,
            failed: function() {}
        };

        var shortcut = new externs.NW.NWShortcut(option);

        externs.NW.App.registerGlobalHotKey(shortcut);
    }
}