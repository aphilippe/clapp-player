package hotkey;

import externs.nw.App;
import externs.nw.Shortcut;

class NWHotkeyManager implements IHotkeyManager
{
    private var _shortcuts:List<Shortcut>;

    public function new() {
        _shortcuts = new List<Shortcut>();
    }

    public function registerHotkey(key:String, func:Void->Void)
    {
        var option = {
            key: key,
            active: func
        };

        var shortcut = new Shortcut(option);

        App.registerGlobalHotKey(shortcut);
        _shortcuts.add(shortcut);
    }

    public function unregisterAll()
    {
        for(shortcut in _shortcuts)
        {
            App.unregisterGlobalHotKey(shortcut);
        }
    }
}