package cordax.ui;

import cordax.native.elements.LayoutElement;
import cordax.native.elements.RootElement;

/**
 * Root application component
 */
class App extends View {
    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        var layout = new LayoutElement(name);
        var res = new RootElement(this, layout);
        res.css.push("application");
        var child = render();
		if (child != null)
			layout.addChild(child.toElement());
        return res;
    }
}