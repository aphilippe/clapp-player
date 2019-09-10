package window;

import window.Window;

class NWWindow implements Window
{
    private var _nwWindow:externs.nw.Window;

    public function new(nwWindow:externs.nw.Window)
    {
        _nwWindow = nwWindow;
    }

    public function onClosed(callback:Void->Bool):Void
    {
        _nwWindow.on("close", function() {
            if(callback())
            {
                _nwWindow.close(true);
            }
        });
    }

    public function close():Void
    {

    }
}