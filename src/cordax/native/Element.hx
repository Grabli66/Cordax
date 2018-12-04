package cordax.native;

import cordax.ui.View;
#if js
    import js.Browser.*;
#end

/**
 * Native element that will be rendered
 */
@:allow(cordax.native.IRender)
class Element {
    /**
     * Child elements
     */
    private var childArray:Array<Element>;

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
     * Inner text
     */
    public var text:String;

    /**
     * On click callback
     */
    public var onClick:() -> Void;

    /**
     * Return childs iterator
     */
    public var childs(get, never):Iterator<Element>;
    public function get_childs():Iterator<Element> {
        return childArray.iterator();
    }

    /**
     * Constructor
     */
    public function new(name:String) {        
        childArray = new Array<Element>();
        this.name = name;
    }

    /**
     * Add child
     * @param child 
     */
    public function addChild(child:Element) {
        childArray.push(child);
    }

    /**
     * Update native element
     */
    public function update() {
        render.update(this);
    }
}

/**
 * Root element for all views
 */
class RootElement extends Element {
    /**
     * Constructor
     * @param view 
     */
    public function new(view:View) {
        super(view.name);
        Cordax.registerViewElement(view, this);
    }
}