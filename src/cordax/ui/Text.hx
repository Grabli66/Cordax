package cordax.ui;

import cordax.native.Element;

typedef TextSettings = {    
    var text:String;
}

/**
 * Text component
 */
class Text extends View {
    /**
     * Settings
     */
    public var settings:TextSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:TextSettings) {
        this.settings = settings;
    }

    /**
     * Convert view to element
     * @return Element
     */
    public override function toElement():Element {
        var res = new Element("");
        res.text = settings.text;
        return res;
    }
}