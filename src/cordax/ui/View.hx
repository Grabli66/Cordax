package cordax.ui;

import cordax.Cordax;
import cordax.native.Element;

/**
 * Base class of all view components
 */
class View {
	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Name of view
	 */
	public var name(get, never):String;

	public function get_name():String {
		var fullName = Type.getClassName(Type.getClass(this));
		var items = fullName.split(".");
		return items[items.length - 1];
	}

	/**
	 * Set state and rerender
	 */
	public function setState() {
        Cordax.document.isDirty = true;
    }

	/**
	 * Render view layout from other views (childs)
	 */
	public function render():View {
		return null;
	}

	/**
	 * Convert view to element
	 * @return Element
	 */
	public function toElement():Element {
		var res = new Element(name);
		var childView = render();
		if (childView != null)
			res.addChild(childView.toElement());
		return res;
	}
}
