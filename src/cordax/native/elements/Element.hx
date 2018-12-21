package cordax.native.elements;

import cordax.ui.View;
import cordax.native.render.IRender;

/**
 * Info, used by native renders
 */
typedef NativeData = {
    /**
     * Native render
     */
    var render:IRender;

    /**
     * Native element
     */
    var nativeElement:Dynamic;
}

/**
 * Native element that will be rendered
 */
@:allow(cordax.native.render.IRender)
class Element {
    /**
     * Native data for rendering
     */
    private var nativeData:NativeData;

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
        if (nativeData == null)
            trace(this);
        nativeData.render.update(this);
    }
}