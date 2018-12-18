package cordax.native.elements;

/**
 * Element to show image
 */
class ImageElement extends Element {
    /**
     * Element image
     */
    public var src:String;

    /**
     * Constructor
     * @param name 
     * @param src 
     */
    public function new(name:String, src:String) {
        super(name);
        this.src = src;
    }
}