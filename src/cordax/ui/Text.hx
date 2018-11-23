package cordax.ui;

import coconut.ui.View;
import coconut.Ui.hxx;

class Text extends View {
    @:attribute var text:String;

    function render() {
		return hxx('
            <div class="text">
                ${text}
            </div>
        ');
	}
}