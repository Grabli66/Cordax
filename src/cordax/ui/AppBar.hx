package cordax.ui;

import cordax.native.elements.LayoutElement;
import cordax.native.elements.RootElement;

/**
 * Appbar settings
 */
typedef AppBarSettings = {
	@:optional var leading:View;
    @:optional var title:View;
    @:optional var actions:View;
}

/**
 * Material AppBar
 */
class AppBar extends View {
    /**
     * Settings
     */
    public final settings:AppBarSettings;

    /**
     * Constructor
     * @param settings 
     */
    public function new(?settings:AppBarSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        var layout = new LayoutElement(name);
        var res = new RootElement(this, layout);
        if (settings != null) {
            if (settings.title != null) {
                var titleElement = settings.title.toElement();
                layout.addChild(titleElement);
            }
        }
        return res;
    }
}