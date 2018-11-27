package cordax;

import cordax.ui.View;

/**
 * Document of native elements
 */
class Document {
	/**
	 * Root element
	 */
	public var root(get, set):View;

	private var rootView:View;

	private function get_root():View {
		return rootView;
	}

	private function set_root(value:View):View {
		rootView = value;
		isDirty = true;
		return value;
	}

	/**
	 * Is document need redraw
	 */
	public var isDirty(get, set):Bool;

	private var isDirtyInternal:Bool;

	private function get_isDirty():Bool {
		return isDirtyInternal;
	}

	private function set_isDirty(value:Bool):Bool {
		isDirtyInternal = value;
		if (onChange != null)
			onChange();
		isDirtyInternal = false;
		return isDirtyInternal;
	}

	/**
	 * Notify document was changed
	 */
	public var onChange:() -> Void;

	/**
	 * Constructor
	 */
	public function new() {
		isDirty = false;
	}
}
