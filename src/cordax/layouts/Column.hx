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
	 * Convert view to element and mount to parent
	 */
	public override function mount(parent:Element):Void {
        var res = Cordax.createElement(this);
        for (child in settings.childs) {
            child.mount(res);
        }
        parent.addChild(res);
    }
}