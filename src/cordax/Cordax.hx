package cordax;

#if js
import js.Browser;
#end

import cordax.ui.View;

/**
 * Helper
 */
class Cordax {
    /**
     * Run application with root view
     * @param view 
     */
    public static function run(view:View){
        #if js
            Browser.document.appendChild(view.toElement().toNative());
        #end
    }

    /**
     * Set title to application
     * @param title 
     */
    public static function setTitle(title:String) {
        Browser.document.getElementsByTagName('title')[0].innerText = title;
    }
}