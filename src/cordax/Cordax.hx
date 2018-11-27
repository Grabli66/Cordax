package cordax;

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
	 * Document of elements
	 */
	public static var document:Document;

	/**
	 * Run application with root view
	 * @param view
	 */
	public static function run(view:View) {
		var document = new Document();
		#if js
		render = new HtmlRender();
		#end

		document.onChange = () -> {
			render.render(document);
		};

		document.root = view;
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
