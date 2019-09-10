package window;

interface Window {
    function onClosed(callback:Void->Bool):Void;
    function close():Void; // should force close close(true) for nwjs
}