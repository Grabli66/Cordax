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
		element.render = this;
		element.nativeElement = res;
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
	public function render(root:Element) {
		trace("RENDER");

		Browser.document.body.innerHTML = "";
		
		var rootElement = createHtmlElement(root);				
		renderChildsRecursive(rootElement, root);

		Browser.document.body.appendChild(rootElement);
	}

	/**
	 * Update element
	 * @param element 
	 */
	public function update(element:Element) {		
		var htmlElement:js.html.Element = cast element.nativeElement;
		htmlElement.innerText = element.text;
	}
}
