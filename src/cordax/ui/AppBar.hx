package cordax.ui;

import cordax.native.Element;

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
        var res = new RootElement(this);
        if (settings != null) {
            if (settings.title != null) {
                var titleElement = settings.title.toElement();
                res.addChild(titleElement);
            }
        }
        return res;
    }
}