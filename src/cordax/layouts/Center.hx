package components.layouts;

import coconut.ui.View;

/**
 * Layout that centers it's content
 */
class Center extends View {
    /**
     * Child content
     */
    @:attribute var child:View;

    function render() {
		return hxx('
            <div class="center">
                ${child}
            </div>
        ');
	}
}