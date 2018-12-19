package cordax.ui;

import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

/**
 * Root application component
 */
class App extends View {
    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {                
        var child = render();
        var childElement:Element = null;
		if (child != null)
			childElement = child.toElement();

        var res = new RootElement(this, childElement, true);
        res.css.push("application");
        return res;
    }
}