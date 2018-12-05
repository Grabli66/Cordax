package cordax.ui;

import cordax.native.Element.RootElement;

/**
 * Base dialog
 */
class Dialog extends View {
}

/**
 * Simple dialog settings
 */
typedef SimpleDialogSettings = {
	var content:View;
}

/**
 * Simple dialog
 */
class SimpleDialog extends Dialog {
    /**
     * Dialog settings
     */
    public final settings:SimpleDialogSettings;

    /**
     * Constructor
     */
    public function new(settings:SimpleDialogSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
		var res = new RootElement(this);        
        var child = settings.content.toElement();
        res.addChild(child);
		return res;
	}
}