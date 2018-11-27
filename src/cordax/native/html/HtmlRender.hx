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
        if (element.text != null)
            res.innerText = element.text;
        return res;
    }

    /**
     * Render document to native
     */
    public function render(document:Document) {
        trace("RENDER");
        var element = document.root.toElement();
        Browser.document.body.innerHTML = "";

        var root = createHtmlElement(element);

        for (child in element.childs) {
            var childDiv = createHtmlElement(child);
            root.appendChild(childDiv);
        }

        Browser.document.body.appendChild(root);
    }
}