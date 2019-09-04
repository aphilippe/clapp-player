package session.service;

import session.Session;
import session.repository.SessionRepository;

class SessionService 
{
    private var _repository:SessionRepository;
    public var CurrentSession(get, null): Session;

    public function new(repository:SessionRepository) 
    {
        _repository = repository;
    }

    public function setCurrentUrl(url:String)
    {
        
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