package cordax.ui;

import haxe.crypto.Md5;
import cordax.Cordax;
import cordax.native.Element;

class Guid {
	public static function generate():String {
		var result = "";

		for (j in 0...32) {
			if (j == 8 || j == 12 || j == 16 || j == 20) {
				result += "-";
			}

			result += StringTools.hex(Math.floor(Math.random() * 16));
		}

		return result.toUpperCase();
	}
}

/**
 * Base class of all view components
 */
class View {
	/**
	 * Id of view
	 */
	public final id:String;

	/**
	 * Constructor
	 */
	public function new() {
		id = Guid.generate();
	}

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
