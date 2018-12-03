package cordax.native;

import cordax.ui.View;

/**
 * Renders elements to native
 */
interface IRender {
    /**
     * Render document to native
     */
    function render(root:Element):Void;

    /**
     * Update element
     */
    function update(element:Element):Void;
}