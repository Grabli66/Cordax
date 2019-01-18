package cordax.native.elements;

import cordax.native.elements.styles.ElementStyle;
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

typedef ChangeInfo = {
    var param:String;
    var value:Dynamic;
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
     * Parameter changed info
     */
    private var changeInfo = new Array<ChangeInfo>();

    /**
     * Element name
     */
    public final name:String;

    /**
     * Css classes
     */
    public final css = new Array<String>();

    /**
     * Local styles of element
     */
    public final style:ElementStyle = {};

    /**
     * On click callback
     */
    public var onClick:() -> Void;

    /**
     * Notify
     */
    function notify(param:String, value:Dynamic) {

    }

    /**
     * Constructor
     */
    public function new(name:String) {
        this.name = name;
    }

    /**
     * Return all changes     
     */
    public function getChanges():Array<ChangeInfo> {
        return null;
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