package cordax.native;

import cordax.native.Element.RootElement;

/**
 * Renders elements to native
 */
interface IRender {
    /**
     * Render element to native
     */
    function render(root:RootElement):Void;

    /**
     * Render element to native dialog
     */
    function renderDialog(root:RootElement):Void;

    /**
     * Update element
     */
    function update(element:Element):Void;

    /**
     * Replace element by new one
     */
    function replace(oldElement:Element, newElement:Element):Void;    
}