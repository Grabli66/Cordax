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

    /**
     * Flex value
     */
    @:attribute var flex:Int = 1;

    function render() {
		return hxx('
            <div class="container" style="flex: ${flex}; max-width: ${width}; max-height: ${height}">
                ${child}
            </div>
        ');
	}
}