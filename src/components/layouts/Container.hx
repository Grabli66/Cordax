package components.layouts;

import coconut.ui.View;

/**
 * Container layout
 */
class Container extends View {
    /**
     * Child view
     */
    @:attribute var child:View;

    @:attribute var width:String = "none";
    @:attribute var height:String = "none";

    function render() {
		return hxx('
            <div class="container flex-0" style="width: ${width}; height: ${height}">
                ${child}
            </div>
        ');
	}
}