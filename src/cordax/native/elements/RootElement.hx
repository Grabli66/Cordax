package cordax.native.elements;

import cordax.ui.View;

/**
 * Root element of view
 */
class RootElement extends LayoutElement {
    /**
     * View id
     */
    public final viewId:String;

    /**
     * Constructor
     */
    public function new(view:View) {
        this.viewId = view.id;
        super(name);
        Cordax.registerViewElement(view, this);
    }
}