package cordax.ui;

import cordax.native.Element;

typedef AppSettings = {
	var title:String;
    @:optional var appBar:View;
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
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        Cordax.setTitle(settings.title);

        var res = new RootElement(this);
        //if (settings.appBar != null)

        var content = settings.content.toElement();
        res.addChild(content);
        return res;
    }
}
