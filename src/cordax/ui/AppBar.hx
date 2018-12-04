package cordax.ui;

import cordax.native.Element;

typedef AppBarSettings = {
	var leading:View;
    var title:View;
    var actions:View;
}

/**
 * Material AppBar
 */
class AppBar extends View {
    /**
	 * Convert view to element and mount to parent
	 */
	public override function mount(parent:Element):Void {
        var res = Cordax.createElement(this);
        parent.addChild(res);
    }
}