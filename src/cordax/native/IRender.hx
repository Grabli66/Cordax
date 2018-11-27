package cordax.native;

/**
 * Renders elements to native
 */
interface IRender {
    /**
     * Render document to native
     */
    function render(document:Document):Void;
}