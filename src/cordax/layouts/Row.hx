package cordax.layouts;

import cordax.native.elements.Element;
import cordax.ui.View;

/**
 * Row settings
 */
typedef RowSettings = {    
    @:optional var crossAlign:String;
    var childs:Array<View>;
}

/**
 * Row layout
 */
class Row extends View {
    /**
     * Settings
     */
    public var settings:RowSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:RowSettings) {
        super();
        this.settings = settings;
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        var res = new RootElement(this);
        for (child in settings.childs) {
            res.addChild(child.toElement());
        }
        return res;
    }
}