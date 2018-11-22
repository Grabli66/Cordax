package components.layouts;

import coconut.ui.View;

/**
 * Column layout
 */
class Column extends View {
    /**
     * Childs view
     */
    @:attribute var childs:tink.pure.List<View>;

    function render() {
		return hxx('
            <div class="column flex-1">
                <for {child in childs}>
                    ${child}
                </for>
            </div>
        ');
	}
}