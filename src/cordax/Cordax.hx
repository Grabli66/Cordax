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
	 * Set title to application
	 * @param title
	 */
	public static function setTitle(title:String) {
		#if js
		Browser.document.getElementsByTagName('title')[0].innerText = title;
		#end
	}
}
