package cordax.ui;

import cordax.native.Element;

typedef ButtonSettings = {    
    var text:String;
    var onClick: () -> Void;
}

/**
 * Button
 */
class Button extends View {
    /**
     * Settings
     */
    public var settings:ButtonSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:ButtonSettings) {
        super();
        this.settings = settings;
    }

    /**
     * Convert view to element
     * @return Element
     */
    public override function toElement():Element {
        var res = new Element(name);
        res.text = settings.text;
        res.onClick = settings.onClick;
        return res;
    }
}