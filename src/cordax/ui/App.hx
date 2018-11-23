package cordax.ui;

import cordax.ui.View;

typedef AppSettings = { 
    >StyleSettings,
    >ChildSettings,

    var title:String;
}

class App extends View {    
    /**
     * Settings of app
     */
    public var appSettings:AppSettings;

    /**
     * Constructor
     * @param params 
     */
    public function new(init:AppSettings) {
        appSettings = init;

        super({
            name: "app",
            css: init.css
        });
    }

    /**
     * Render to element
     */
    override function render() {
        Cordax.setTitle(appSettings.title);
        return new Text({text: "Text"});
    }
}