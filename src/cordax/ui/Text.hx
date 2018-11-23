package cordax.ui;

import cordax.ui.View;

typedef TextSettings = {
    >StyleSettings,
    
    var text:String;
}

/**
 * Text view
 */
class Text extends View {
    /**
     * Settings
     */
    public var textSettings:TextSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(init:TextSettings) {
        super({
            name: "text",
            css: init.css
        });
        textSettings = init;
    }
}