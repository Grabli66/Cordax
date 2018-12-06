package cordax.native.html;

import js.html.Document;
import cordax.native.Element.RootElement;
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
	 * Element dialogs
	 */
	private var dialogElement:js.html.Element;

	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Apply element settings to html element
	 * @param element
	 * @param htmlElement
	 */
	private function applyToHtmlElement(element:Element, htmlElement:js.html.Element) {
		var elementName = element.name.toLowerCase();
		htmlElement.classList.add(elementName);
		for (css in element.css) {
			htmlElement.classList.add(css);
		}

		if (element.text != null)
			htmlElement.innerText = element.text;

		if (element.onClick != null)
			htmlElement.onclick = element.onClick;
	}

	/**
	 * Create new html element
	 * @param element
	 * @return js.html.Element
	 */
	private function createHtmlElement(element:cordax.native.Element):js.html.Element {
		var htmlElement = Browser.document.createDivElement();
		element.render = this;
		element.nativeElement = htmlElement;
		applyToHtmlElement(element, htmlElement);
		return htmlElement;
	}

	/**
	 * Render childs recursively
	 * @param root
	 * @param element
	 */
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
	public function render(root:RootElement) {
		trace("RENDER");

		Browser.document.body.innerHTML = "";
		dialogElement = null;

		var rootElement = createHtmlElement(root);
		renderChildsRecursive(rootElement, root);

		Browser.document.body.appendChild(rootElement);
	}

	/**
	 * Render element to native dialog
	 */
	public function renderDialog(root:RootElement) {
		trace("RENDER DIALOG");
		if (dialogElement != null)
			dialogElement.remove();
		dialogElement = Browser.document.createDivElement();
		dialogElement.id = "dialogs";
		Browser.document.body.appendChild(dialogElement);

		var overlay = Browser.document.createDivElement();
		overlay.className = "overlay";
		dialogElement.appendChild(overlay);

		var rootElement = createHtmlElement(root);
		renderChildsRecursive(rootElement, root);
		dialogElement.appendChild(rootElement);
	}

	/**
	 * Update element
	 * @param element
	 */
	public function update(element:Element) {
		trace("UPDATE");
		var htmlElement:js.html.Element = cast element.nativeElement;
		applyToHtmlElement(element, htmlElement);
	}

	/**
	 * Replace element by new one
	 */
	public function replace(oldElement:Element, newElement:Element):Void {
		trace("REPLACE");
		var htmlElement:js.html.Element = cast oldElement.nativeElement;
		var parent = htmlElement.parentElement;
		var rootElement = createHtmlElement(newElement);
		renderChildsRecursive(rootElement, newElement);
		parent.replaceChild(rootElement, htmlElement);
	}
}
