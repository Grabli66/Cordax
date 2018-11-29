package cordax.native;

import cordax.ui.View;

/**
 * Renders elements to native
 */
interface IRender {
    /**
     * Render document to native
     */
    function render(document:Document, view:View = null):Void;
}