package shell.service;

import shell.Shell;

class ShellService
{
    var _shell: Shell;

    public function new (shell:Shell)
    {
        _shell = shell;
    }

    public function openExternalUri(uri:String)
    {
        _shell.openExternalUri(uri);
    }
}