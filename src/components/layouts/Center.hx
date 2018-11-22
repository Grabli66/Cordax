package components.layouts;

import coconut.ui.View;

/**
 * Layout that centers it's content
 */
class Center extends View {
    /**
     * Child content
     */
    @:attribute var content:View;

    function render() {
		return hxx('
            <div class="flex-1">
                ${content}
            </div>
        ');
	}
}