package cordax.native.elements;

import cordax.ui.View;
import cordax.native.elements.Element;

/**
 * Settings for root
 */
typedef RootSettings = {
	@:optional var isContainer:Bool;
	var attachment:Element;
    var view:View;
}

/**
 * Settings for text
 */
typedef TextSettings = {
    var name:String;
	var text:String;
}

/**
 * For building elements
 */
class Builder {
	/**
	 * Create new root element
	 * @return RootElement
	 */
	public static function root(settings:RootSettings):RootElement {
        var res = new RootElement(settings.view, settings.attachment, settings.isContainer);
        return res;
	}

	/**
	 * Create new text element
	 * @return TextElement
	 */
	public static function text(settings:TextSettings):TextElement {
        var res = new TextElement(settings.name);
        res.text = settings.text;  
		return res;
	}
}
