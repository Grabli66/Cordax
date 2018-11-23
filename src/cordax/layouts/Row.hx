package components.layouts;

import coconut.ui.View;
import components.layouts.AxisAlignSetting;

/**
 * Row layout
 */
class Row extends View {
    /**
     * Childs view
     */
    @:attribute var childs:tink.pure.List<Dynamic>;

    /**
     * Flex value
     */
    @:attribute var flex:Int = 1;

    /**
     * Align of cross axis
     */
    @:attribute var crossAxisAlign:CrossAxisAlignSetting = CrossAxisAlignSetting.None;

    /**
     * Align of main axis
     */
    @:attribute var mainAxisAlign:MainAxisAlignSetting = MainAxisAlignSetting.None;

    function render() {
        var style = 'flex: ${flex}; align-items: ${crossAxisAlign}; justify-content: ${mainAxisAlign}';

		return hxx('
            <div class="row" style=${style}>
                <for {child in childs}>
                    ${child}
                </for>
            </div>
        ');
	}
}