package cordax.ui;

import cordax.native.Element;

/**
 * Root application component
 */
class App extends View {
    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        var res = new RootElement(this);
        res.css.push("application");
        var child = render();
		if (child != null)
			res.addChild(child.toElement());
        return res;
    }
}