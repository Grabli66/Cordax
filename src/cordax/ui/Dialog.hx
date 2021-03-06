package cordax.ui;

import cordax.native.elements.ImageElement;
import cordax.native.elements.LayoutElement;
import cordax.native.elements.Element;
import cordax.native.elements.RootElement;
import cordax.ui.layouts.Row;

/**
 * Base dialog
 */
class Dialog extends View {
}

/**
 * Simple dialog settings
 */
typedef SimpleDialogSettings = {
    var title:View;
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
        var layout = new LayoutElement(name);

		var res = new RootElement(this, layout);
        
        var header = new LayoutElement("header");
        var title = settings.title.toElement();
        title.css.push("title");
        header.addChild(title);

        var closeButton = new ImageElement("close", "img/menu.svg");
        closeButton.onClick = () -> {
            Cordax.closeDialog();
        };
        header.addChild(closeButton);

        layout.addChild(header);
        var content = settings.content.toElement();        
        layout.addChild(content);
		return res;
	}
}