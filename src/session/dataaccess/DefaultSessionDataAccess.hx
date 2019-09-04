package session.dataaccess;

import session.dataaccess.SessionDataAccess; 
import haxe.io.Path;
import externs.NW;
import externs.Fs;

class DefaultSessionDataAccess implements SessionDataAccess
{
    public function new() {}

    public function get():SessionData
    {
        var sessionFilePath = Path.join([NW.App.dataPath, "session"]);
        if (!FS.existsSync(sessionFilePath))
        {
            return null;
        }

        var sessionFileString = FS.readFileSync(sessionFilePath, "utf8");
        
        return haxe.Json.parse(sessionFileString);
    }

    public function save(data:SessionData)
    {

    }
}