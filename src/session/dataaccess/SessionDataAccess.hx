package session.dataaccess;


interface SessionDataAccess
{
    function get():SessionData;
    function save(data:SessionData):Void;
}

typedef SessionData = {
    url:String
}
