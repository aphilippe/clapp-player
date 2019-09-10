package shell.service;

import shell.service.ShellService;

class ShellServiceFactory
{
    public static function create()
    {
        return new ShellService(new shell.NWShell());
    }
}