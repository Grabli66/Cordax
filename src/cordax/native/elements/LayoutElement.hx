package cordax.native.elements;

/**
 * Element to layout
 */
class LayoutElement extends Element {
    /**
     * Child elements
     */
    private var childArray:Array<Element>;

    /**
     * Constructor
     */
    public function new(name:String) {
        childArray = new Array<Element>();
        super(name);
    }

    /**
     * Return childs iterator
     */
    public var childs(get, never):Iterator<Element>;
    public function get_childs():Iterator<Element> {
        return childArray.iterator();
    }

    /**
     * Add child
     * @param child 
     */
    public function addChild(child:Element) {
        childArray.push(child);
    }
}