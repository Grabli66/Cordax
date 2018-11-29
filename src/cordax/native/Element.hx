package cordax.native;

#if js
    import js.Browser.*;
#end

/**
 * Native element that will be rendered
 */
class Element {
    /**
     * Child elements
     */
    private var childArray:Array<Element>;

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
}