package;

import externs.Webview;

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
        _webview.addEventListener("contentload", 
            function() {
                _webview.executeScript(
                    {
                        code:"
                            if (!connector)
                            {
                                class YoutubeClappConnector {
                                    init () {
                                        this.player = document.getElementsByTagName('video')[0];
                                        this.nextButton = document.getElementsByClassName('ytp-next-button')[0];
                                    }

                                    togglePlayPause() {
                                        if (this.player.paused) this.player.play();
                                        else this.player.pause();
                                    }

                                    next() {
                                        this.nextButton.click();
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

    public function next()
    {
        _webview.executeScript({code:"
                connector.next();
            ",
            mainWorld:true});
    }

    public function previous()
    {
        _webview.back();
    }

    public function openDevTools()
    {
        _webview.showDevTools(true);
    }
}