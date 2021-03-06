package cordax.native.render.html;

import cordax.native.elements.ImageElement;
import cordax.native.elements.LayoutElement;
import cordax.native.elements.Element;
import cordax.native.elements.TextElement;
import cordax.native.elements.RootElement;
import cordax.ui.View;
import cordax.util.MacroHelper;
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
	var dialogElement:js.html.Element;

	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Apply element settings to html element
	 * @param element
	 * @param htmlElement
	 */
	function applyToHtmlElement(element:Element, htmlElement:js.html.Element) {
		var elementName = element.name.toLowerCase();
		htmlElement.classList.add(elementName);
		for (css in element.css) {
			htmlElement.classList.add(css);
		}

		if ((element is TextElement)) {
			var textElement:TextElement = cast element;
			if (textElement.text != null)
				htmlElement.innerText = textElement.text;
		} else if ((element is ImageElement)) {
			var imgElement:ImageElement = cast element;
			if (imgElement.src != null)
				htmlElement.setAttribute("src", imgElement.src);
		}

		if (element.onClick != null)
			htmlElement.onclick = element.onClick;

		element.nativeData = {
			render: this,
			nativeElement: htmlElement
		};
	}

	/**
	 * Render element
	 * @return Element
	 */
	function renderElement(element:Element):js.html.Element {
		if ((element is RootElement)) {
			var rootElement:RootElement = cast element;
			var rootContainer:js.html.Element = null;
			if (rootElement.isContainer) {
				rootContainer = Browser.document.createDivElement();
				applyToHtmlElement(rootElement, rootContainer);
				if (rootElement.attachment != null) {
					var childElement = renderElement(rootElement.attachment);
					if (childElement != null) {
						applyToHtmlElement(rootElement.attachment, childElement);
						rootContainer.appendChild(childElement);
					}
				}
			} else {
				if (rootElement.attachment != null) {
					rootContainer = renderElement(rootElement.attachment);
					if (rootContainer != null)
						applyToHtmlElement(rootElement.attachment, rootContainer);
				}
			}

			return rootContainer;
		} else if ((element is LayoutElement)) {
			var rootContainer = Browser.document.createDivElement();
			var layoutElement:LayoutElement = cast element;
			for (child in layoutElement.childs) {
				var childElement = renderElement(child);
				if (childElement != null) {
					applyToHtmlElement(child, childElement);
					rootContainer.appendChild(childElement);
				}
			}

			return rootContainer;
		} else if ((element is TextElement)) {
			var textChild = Browser.document.createDivElement();
			applyToHtmlElement(element, textChild);
			return textChild;
		}

		return null;
	}	

	/**
	 * Append base styles to body
	 */
	function appendBaseStyles() {
		var styleNode = Browser.document.createStyleElement();
		styleNode.type = "text/css";
		styleNode.textContent = FileUtil.getFileText("./assets/cordax-mobile.css");
		Browser.document.body.appendChild(styleNode);
	}

	/**
	 * Render document to native
	 */
	public function render(root:RootElement) {
		// TODO: trace elements tree
		trace("RENDER");		

		Browser.document.body.innerHTML = "";
		dialogElement = null;

		var rootElement = renderElement(root);
		appendBaseStyles();

		Browser.document.body.appendChild(rootElement);
	}

	/**
	 * Render element to native dialog
	 */
	public function renderDialog(root:RootElement, onClose:() -> Void) {
		trace("RENDER DIALOG");
		if (dialogElement != null)
			dialogElement.remove();
		dialogElement = Browser.document.createDivElement();
		dialogElement.id = "dialogs";
		Browser.document.body.appendChild(dialogElement);

		var overlay = Browser.document.createDivElement();
		overlay.className = "overlay";
		overlay.onclick = () -> {
			onClose();
			dialogElement.remove();
		};
		dialogElement.appendChild(overlay);

		var rootElement = renderElement(root);		
		dialogElement.appendChild(rootElement);
	}

	/**
	 * Close current dialog
	 * @param id
	 */
	public function closeDialog():Void {
		if (dialogElement != null)
			dialogElement.remove();
	}

	/**
	 * Update element
	 * @param element
	 */
	public function update(element:Element) {
		trace("UPDATE");
		var htmlElement:js.html.Element = cast element.nativeData.nativeElement;
		applyToHtmlElement(element, htmlElement);
	}

	/**
	 * Replace element by new one
	 */
	public function replace(oldElement:Element, newElement:Element):Void {
		trace("REPLACE");
		var htmlElement:js.html.Element = cast oldElement.nativeData.nativeElement;
		var parent = htmlElement.parentElement;
		var rootElement = renderElement(newElement);
		parent.replaceChild(rootElement, htmlElement);
	}
}
