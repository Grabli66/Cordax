package cordax.layouts;

import cordax.native.Element;
import cordax.ui.View;

typedef ColumnSettings = {    
    @:optional var crossAlign:String;
    var childs:Array<View>;
}

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
     * @return Element
     */
    public override function toElement():Element {
        var res = new Element(name);
        for (child in settings.childs) {
            res.addChild(child.toElement());
        }
        return res;
    }
}