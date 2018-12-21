package cordax.ui;

import cordax.ui.Dialog;
import cordax.Cordax;
import cordax.util.Guid;
import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

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
	 * Change state and rerender view
	 */
	public function setState():Void {
		Cordax.partialRender(this);
	}

	/**
	 * Show dialog
	 * @param init 
	 * @return -> Dialog)
	 */
	public function showDialog(settings:ShowDialogSettings) {
		Cordax.renderDialog(settings);
	}

	/**
	 * Render view layout from other views (childs)
	 */
	public function render():View {
		return null;
	}

	/**
	 * Convert view to element
	 */
	public function toElement():RootElement {		
		var attachElement:Element = null;
		var attachView = render();
		if (attachView != null)
			attachElement = attachView.toElement();

		var root = new RootElement(this, attachElement);
        return root;
	}
}
