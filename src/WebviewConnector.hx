package;

import externs.Webview;
import hotkey.IHotkeyManager;

class WebviewConnector
{
    private var _webview:Webview;
    public function new(webview:Webview)
    {
        _webview = webview;
    }

    public function start()
    {
        initWebview();
    }

    private function initWebview()
    {
        _webview.addEventListener("loadstop", 
            function() {
                _webview.executeScript(
                    {
                        code:"
                            if (!connector)
                            {
                                class YoutubeClappConnector {
                                    init () {
                                        this.player = document.getElementsByTagName('video')[0];
                                    }

                                    togglePlayPause() {
                                        if (this.player.paused) this.player.play();
                                        else this.player.pause();
                                    }
                                }
                                var connector = new YoutubeClappConnector();
                            }
                            connector.init();
                        ",
                        mainWorld:true
                    }
                );
            }
        );
    }

    public function togglePlayPause()
    {
        _webview.executeScript({code:"
                connector.togglePlayPause();
            ",
        mainWorld:true});
    }
}