package cordax.ui.layouts;

import cordax.native.elements.LayoutElement;
import cordax.native.elements.Element;
import cordax.native.elements.RootElement;
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
        var layout = new LayoutElement(name);
        
        var res = new RootElement(this, layout);
        for (child in settings.childs) {
            layout.addChild(child.toElement());
        }
        return res;
    }
}