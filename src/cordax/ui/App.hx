package cordax.ui;

import cordax.native.Element;

typedef AppSettings = {
	var title:String;
	var content:View;
}

/**
 * App component
 */
class App extends View {
    /**
     * Settings of app
     */
    private var settings:AppSettings;

	/**
	 * Constructor
	 */
	public function new(settings:AppSettings) {
        this.settings = settings;
    }

    /**
     * Convert view to element
     * @return Element
     */
    public override function toElement():Element {
        Cordax.setTitle(settings.title);

        var res = new Element("");
        res.addChild(settings.content.toElement());
        return res;
    }
}
