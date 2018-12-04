package cordax;

import cordax.native.Element;
import cordax.native.IRender;
import cordax.ui.View;

#if js
import js.Browser;
import cordax.native.html.HtmlRender;
#end

/**
 * Helper
 */
class Cordax {
	/**
	 * Elements by view id
	 */
	private static var views = new Map<String, Element>();

	/**
	 * Render of app
	 */
	private static var render:IRender;

	/**
	 * Run application with root view
	 * @param view
	 */
	public static function run(view:View) {
		#if js
		render = new HtmlRender();
		#end		

		var root = new Element("application");
		view.mount(root);
		render.render(root);
	}

	/**
	 * View partial render
	 * @param view 
	 */
	public static function partialRender(view:View) {
		var element = views.get(view.id);
		//element.parent.replaceElement(element);
	}

	/**
	 * Create new element and register it
	 * @param view 
	 * @return Element
	 */
	public static function createElement(view:View):Element {
		var res = new Element(view.name);
		views[view.id] = res;
		return res;
	}

	/**
	 * Set title to application
	 * @param title
	 */
	public static function setTitle(title:String) {
		#if js
		Browser.document.getElementsByTagName('title')[0].innerText = title;
		#end
	}
}
