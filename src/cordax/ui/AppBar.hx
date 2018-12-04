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
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        var res = new RootElement(this);
        return res;
    }
}