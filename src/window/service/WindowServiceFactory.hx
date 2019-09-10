package window.service;

import window.service.NWWindowService;

class WindowServiceFactory
{
    public static function create()
    {
        return new NWWindowService();
    }
}