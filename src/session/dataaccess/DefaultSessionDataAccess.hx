package session.dataaccess;

import session.dataaccess.SessionDataAccess; 
import haxe.io.Path;
import externs.nw.App;
import externs.Fs;

class DefaultSessionDataAccess implements SessionDataAccess
{
    public function new() {}

    public function get():SessionData
    {
        var sessionFilePath = Path.join([App.dataPath, "session"]);
        if (!FS.existsSync(sessionFilePath))
        {
            return null;
        }

        var sessionFileString = FS.readFileSync(sessionFilePath, "utf8");
        
        return haxe.Json.parse(sessionFileString);
    }

    public function save(data:SessionData)
    {
        var sessionFilePath = Path.join([App.dataPath, "session"]);
        FS.writeFileSync(sessionFilePath, haxe.Json.stringify(data));
    }
}