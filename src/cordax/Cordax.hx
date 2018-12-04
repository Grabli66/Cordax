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
@:allow(cordax.native.Element)
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
	 * Register view element
	 */
	private static function registerViewElement(view:View, element:Element) {
		views[view.id] = element;
	}

	/**
	 * Run application with root view
	 * @param view
	 */
	public static function run(view:View) {
		#if js
		render = new HtmlRender();
		#end		
		
		var root = view.toElement();

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
	 * Set title to application
	 * @param title
	 */
	public static function setTitle(title:String) {
		#if js
		Browser.document.getElementsByTagName('title')[0].innerText = title;
		#end
	}
}
