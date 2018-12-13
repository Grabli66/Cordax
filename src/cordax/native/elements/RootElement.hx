package cordax.native.elements;

import cordax.ui.View;

/**
 * Root element of view
 */
class RootElement extends Element {
    /**
     * View id
     */
    public final viewId:String;

    /**
     * Attached element with content
     */
    public final attachment:Element;

    /**
     * Constructor
     */
    public function new(view:View, attachment:Element) {
        this.attachment = attachment;
        this.viewId = view.id;
        super(name);
        Cordax.registerViewElement(view, this);
    }    
}