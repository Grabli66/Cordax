package cordax.ui;

import cordax.native.elements.LayoutElement;
import cordax.native.elements.RootElement;

/**
 * Scaffold settings
 */
typedef ScaffoldSettings = {
	var title:String;
    @:optional var appBar:View;
	var content:View;
}

/**
 * App component
 */
class Scaffold extends View {
    /**
     * Settings of app
     */
    private var settings:ScaffoldSettings;

	/**
	 * Constructor
	 */
	public function new(settings:ScaffoldSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        Cordax.setTitle(settings.title);

        var layout = new LayoutElement(name);
        var res = new RootElement(this, layout, false);
        if (settings.appBar != null) {
            var appbarElement = settings.appBar.toElement();
            layout.addChild(appbarElement);
        }

        var content = settings.content.toElement();
        layout.addChild(content);
        return res;
    }
}
