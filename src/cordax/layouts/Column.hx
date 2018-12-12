package cordax.layouts;

import cordax.native.elements.Element;
import cordax.ui.View;

typedef ColumnSettings = {    
    @:optional var crossAlign:String;
    var childs:Array<View>;
}

/**
 * Column layout
 */
class Column extends View {
    /**
     * Settings
     */
    public var settings:ColumnSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:ColumnSettings) {
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