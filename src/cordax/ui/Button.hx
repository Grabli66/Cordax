package cordax.ui;

import cordax.native.Element;

typedef ButtonSettings = {    
    var text:String;
    var onClick: () -> Void;
}

/**
 * Button
 */
class Button extends View {
    /**
     * Settings
     */
    public var settings:ButtonSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:ButtonSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element and mount to parent
	 */
	public override function mount(parent:Element):Void {
        var res = Cordax.createElement(this);
        res.text = settings.text;
        res.onClick = settings.onClick;
        parent.addChild(res);
    }
}