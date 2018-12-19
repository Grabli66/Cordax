package cordax.ui;

import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

/**
 * List with items
 */
class ListView extends View {
    /**
     * Constructor
     */
    public function new() {
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