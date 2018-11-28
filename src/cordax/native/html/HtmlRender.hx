package cordax.native.html;

import js.Browser;
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
    public function render(document:Document) {
        trace("RENDER");
        var element = document.root.toElement();
        Browser.document.body.innerHTML = "";

        var root = createHtmlElement(element);
        renderChildsRecursive(root, element);

        Browser.document.body.appendChild(root);
    }
}