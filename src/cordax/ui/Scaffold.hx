package cordax.ui;

import cordax.native.elements.Element;

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

        var res = new RootElement(this);
        if (settings.appBar != null) {
            var appbarElement = settings.appBar.toElement();
            res.addChild(appbarElement);
        }

        var content = settings.content.toElement();
        res.addChild(content);
        return res;
    }
}
