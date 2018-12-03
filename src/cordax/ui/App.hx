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
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element and mount to parent
	 */
	public override function mount(parent:Element):Void {
        Cordax.setTitle(settings.title);

        var res = new Element(name);
        settings.content.mount(res);
        parent.addChild(res);
    }
}
