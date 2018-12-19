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
     * Is root element is container of attachment
     */
    public final isContainer:Bool;

    /**
     * Constructor
     */
    public function new(view:View, attachment:Element, isContainer:Bool = false) {
        this.attachment = attachment;
        this.viewId = view.id;
        this.isContainer = isContainer;
        super(view.name);
        Cordax.registerViewElement(view, this);
    }    
}