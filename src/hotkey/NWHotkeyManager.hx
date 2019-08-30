package hotkey;

class NWHotkeyManager implements IHotkeyManager
{
    private var _shortcuts:List<externs.NW.NWShortcut>;

    public function new() {
        _shortcuts = new List<externs.NW.NWShortcut>();
    }

    public function registerHotkey(key:String, func:Void->Void)
    {
        var option = {
            key: key,
            active: func,
            failed: function() {}
        };

        var shortcut = new externs.NW.NWShortcut(option);

        externs.NW.App.registerGlobalHotKey(shortcut);
        _shortcuts.add(shortcut);
    }

    public function unregisterAll()
    {
        for(shortcut in _shortcuts)
        {
            externs.NW.App.unregisterGlobalHotKey(shortcut);
        }
    }
}