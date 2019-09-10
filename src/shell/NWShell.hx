package shell;

import shell.Shell;

class NWShell implements Shell
{
    public function new() {}

    public function openExternalUri(uri:String)
    {
        externs.nw.Shell.openExternal(uri);
    }
}