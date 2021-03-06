package cordax.ui.layouts;

import cordax.native.elements.LayoutElement;
import cordax.native.elements.RootElement;
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
        var layout = new LayoutElement(name);

        var res = new RootElement(this, layout);
        for (child in settings.childs) {
            layout.addChild(child.toElement());
        }
        return res;
    }
}