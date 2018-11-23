package components.layouts;

import coconut.data.Model;
import coconut.ui.View;

/**
 * Padding box
 */
class PaddingSettings implements Model {
    @:constant var left:Int = @byDefault 0;
    @:constant var top:Int = @byDefault 0;
    @:constant var right:Int = @byDefault 0;
    @:constant var bottom:Int = @byDefault 0;

    public static function all(value:Int) {
        return new PaddingSettings({
            left: value,
            top: value,
            right: value,
            bottom: value
        });
    }
}

/**
 * Padding layout
 */
class Padding extends View {
    /**
     * Child content
     */
    @:attribute var child:View;

    /**
     * Padding value
     */
    @:attribute var padding: PaddingSettings;

    /**
     * Flex value
     */
    @:attribute var flex:Int = 1;

    function render() {
        var style = 'flex: ${flex}; padding: ${padding.top}px ${padding.right}px ${padding.bottom}px ${padding.left}px';

		return hxx('
            <div class="padding" style=${style}>
                ${child}
            </div>
        ');
	}
}