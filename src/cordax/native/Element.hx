package cordax.native;

#if js
    import js.Browser.*;
#end

/**
 * Native element that will be rendered
 */
@:allow(cordax.native.IRender)
@:allow(cordax.Cordax)
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
    private function new(name:String) {        
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