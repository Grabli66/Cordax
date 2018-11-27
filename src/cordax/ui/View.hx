package cordax.ui;

import cordax.Cordax;
import cordax.native.Element;

/**
 * Base class of all view components
 */
class View {
    /**
     * Render view layout from other views (childs)
     */
    public function render():View {
        return null;
    }

    /**
     * Convert view to element
     * @return Element
     */
    public function toElement():Element {
        var res = new Element("");
        var childView = render();
        if (childView != null)
            res.addChild(childView.toElement());
        return res;
    }
}