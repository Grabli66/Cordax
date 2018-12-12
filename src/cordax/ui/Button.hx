package cordax.ui;

import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

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
	 */
	public override function toElement():RootElement {
        var res = new RootElement(this);
        res.text = settings.text;
        res.onClick = settings.onClick;
        return res;
    }
}