package window.service;

import window.service.WindowService;
import window.Window;
import window.NWWindow;

class NWWindowService implements WindowService
{
    public function new() {}

    public function getCurrentWindow():Window
    {
        return new NWWindow(externs.nw.Window.get());
    }
}