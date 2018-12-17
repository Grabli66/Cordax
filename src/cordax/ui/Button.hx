package cordax.ui;

import cordax.native.elements.TextElement;
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
        var textElement = new TextElement("text");
        textElement.text = settings.text;
        textElement.onClick = settings.onClick;
        
        var res = new RootElement(this, textElement);        
        return res;
    }
}