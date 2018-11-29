package cordax.native.html;

import cordax.ui.View;
import js.Browser;

/**
 * View to native element
 */
class ViewPair {
    public final view:View;
    public final element:js.html.Element;

    public function new(view:View, element:js.html.Element) {
        this.view = view;
        this.element = element;
    }
}

/**
 * Render document to html
 */
class HtmlRender implements IRender {
    /**
     * Views to native elements
     */
    var views = new Map<String, ViewPair>();

	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Create new html element
	 * @param element
	 * @return js.html.Element
	 */
	private function createHtmlElement(element:cordax.native.Element):js.html.Element {
		var res = Browser.document.createDivElement();
		res.className = element.name.toLowerCase();
		if (element.text != null)
			res.innerText = element.text;

		if (element.onClick != null)
			res.onclick = element.onClick;

		return res;
	}

	private function renderChildsRecursive(root:js.html.Element, element:cordax.native.Element) {
		for (child in element.childs) {
			var childDiv = createHtmlElement(child);
			renderChildsRecursive(childDiv, child);
			root.appendChild(childDiv);
		}
	}

	/**
	 * Render document to native
	 */
	public function render(document:Document, view:View = null) {
		trace("RENDER");
		if (view == null) {			
			Browser.document.body.innerHTML = "";

            var element = document.root.toElement();
			var root = createHtmlElement(element);

            views[document.root.id] = new ViewPair(document.root, root);
			renderChildsRecursive(root, element);

			Browser.document.body.appendChild(root);
		}
	}
}
