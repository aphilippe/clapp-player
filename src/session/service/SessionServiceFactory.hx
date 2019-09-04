package session.service;

import session.service.SessionService;
import session.repository.SessionRepository;
import session.dataaccess.DefaultSessionDataAccess;

class SessionServiceFactory
{
    public static function create():SessionService
    {
        var dataAccess = new DefaultSessionDataAccess();
        var repository = new SessionRepository(dataAccess);

        return new SessionService(repository);
    }
}
