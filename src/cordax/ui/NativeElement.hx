package cordax.ui;

#if js
    import js.Browser.*;
#end

typedef NativeElementSettings = {
    var name:String;
    @:optional var css:String;
    @:optional var childs:Array<NativeElement>;
}

/**
 * Native tag that will be rendered
 */
class NativeElement {
    /**
     * Parameters of tag
     */
    final params:NativeElementSettings;

    /**
     * Constructor
     * @param params 
     */
    public function new(params:NativeElementSettings) {
        this.params = params;
    }

    /**
     * Render to native
     * @return js.html.Element
     */
    public function toNative():js.html.Element {
        var res = document.createElement(params.name);
        res.className = params.css;
        return res;
    }
}