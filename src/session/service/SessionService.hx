package session.service;

import session.Session;
import session.repository.SessionRepository;
import session.dataaccess.SessionDataAccess;

class SessionService 
{
    private var _repository:SessionRepository;
    private var _sessionDataAccess:SessionDataAccess;
    public var CurrentSession(get, null): Session;

    public function new(repository:SessionRepository, dataaccess:SessionDataAccess) 
    {
        _repository = repository;
        _sessionDataAccess = dataaccess;
    }

    public function setCurrentSessionUrl(url:String)
    {
        _sessionDataAccess.save({url:url});
    }

    public function save()
    {

    }

    function get_CurrentSession()
    {
        var session = _repository.get();
        if (session == null)
        {
            return new Session("http://www.youtube.com");
        }
        
        return _repository.get();
    }
}