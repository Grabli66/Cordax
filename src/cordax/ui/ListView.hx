package cordax.ui;

import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

/**
 * Adapter for list view items
 */
class ListViewAdapter {
    /**
     * Render item to view
     * @param data 
     * @return View
     */
    public function render(data:Dynamic):View {
        throw "Not implemented";
    }
}

/**
 * List with items
 */
class ListView extends View {
    /**
     * Constructor
     */
    public function new(adapter:ListViewAdapter) {
        super();
    }

    /**
	 * Convert view to element
	 */
	public override function toElement() {		
		var attachElement:Element = null;
		
		var root = new RootElement(this, attachElement, true);
        return root;
	}
}