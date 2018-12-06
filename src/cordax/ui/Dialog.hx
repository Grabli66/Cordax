package cordax.ui;

import cordax.layouts.Row;
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

class SimpleDialogHeader extends Row {

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
        var row = new SimpleDialogHeader({
            childs: [
                settings.content
            ]
        });        

        res.addChild(row.toElement());
		return res;
	}
}