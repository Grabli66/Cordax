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
 * Model of view
 */
class ViewModel {
	/**
	 * Changed parameters
	 */
	private final changed = new Map<String, Dynamic>();

	/**
	 * Is dirty
	 */
	private var isDirty:Bool;

	/**
	 * Calls on change
	 */
	public var onChange:(Map<String, Dynamic>) -> Void;

	/**
	 * Notify about changes
	 * @param name 
	 * @param value 
	 */
	private function notify(name:String, value:Dynamic) {
		changed[name] = value;
		isDirty = true;
	}

	/**
	 * Notify about change
	 */
	public function apply() {
		if ((onChange != null) && (isDirty)) {
			onChange(changed);
			isDirty = false;
		}
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
	 * Render view layout from other views (childs)
	 */
	public function render():View {
		return null;
	}

	/**
	 * Convert view to element and mount to parent
	 */
	public function mount(parent:Element):Void {
		var res = new Element(name);
		var childView = render();
		if (childView != null)
			childView.mount(res);
		parent.addChild(res);
	}
}
