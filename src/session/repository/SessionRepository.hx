package session.repository;

import session.dataaccess.SessionDataAccess;
import session.Session;

class SessionRepository
{
    private var _sessionDataAccess:SessionDataAccess;

    public function new (sessionDataAccess:SessionDataAccess)
    {
        _sessionDataAccess = sessionDataAccess;
    }

    public function get():Session
    {
        var data = _sessionDataAccess.get();

        if (data == null)
        {
            return null;
        }

        return new Session(data.url);
    }
}