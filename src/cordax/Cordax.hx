package cordax;

import cordax.native.elements.Element;
import cordax.native.render.IRender;
import cordax.ui.View;
import cordax.ui.Dialog;

#if js
import js.Browser;
import cordax.native.render.html.HtmlRender;
#end

/**
 * Show dialog settings
 */
typedef ShowDialogSettings = {
	var builder:() -> Dialog;
	var onClose:() -> Void;
}

/**
 * Helper
 */
@:allow(cordax.native.elements.Element)
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
		var oldElement = views.get(view.id);
		var newElement = view.toElement();
		render.replace(oldElement, newElement);
	}

	/**
	 * Render and show dialog
	 * @param dialog 
	 */
	public static function renderDialog(settings:ShowDialogSettings) {
		render.renderDialog(settings.builder().toElement(), settings.onClose);
	}

	/**
	 * Close opened dialog
	 * @param dialog 
	 */
	public static function closeDialog() {
		render.closeDialog();
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
