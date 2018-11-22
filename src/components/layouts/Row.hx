package components.layouts;

import coconut.ui.View;

/**
 * Row layout
 */
class Row extends View {
    /**
     * Childs view
     */
    @:attribute var childs:tink.pure.List<View>;

    function render() {
		return hxx('
            <div class="row flex-1">
                <for {child in childs}>
                    ${child}
                </for>
            </div>
        ');
	}
}