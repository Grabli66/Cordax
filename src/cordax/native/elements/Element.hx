package cordax.native.elements;

import cordax.ui.View;
import cordax.native.render.IRender;

/**
 * Native element that will be rendered
 */
@:allow(cordax.native.render.IRender)
class Element {
    /**
     * Native element
     */
    private var nativeElement:Dynamic;

    /**
     * Render to update element
     */
    private var render:IRender;

    /**
     * Element name
     */
    public final name:String;

    /**
     * Css classes
     */
    public final css = new Array<String>();

    /**
     * On click callback
     */
    public var onClick:() -> Void;

    /**
     * Constructor
     */
    public function new(name:String) {
        this.name = name;
    }

    /**
     * Update native element
     */
    public function update() {
        render.update(this);
    }
}