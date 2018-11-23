package cordax.ui;

import coconut.ui.View;

class Image extends View {
    @:attribute var src:String;

    function render() {
		return hxx('
            <img class="image" src=${src} />
        ');
	}
}