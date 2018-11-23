package components;

import coconut.ui.View;

class CircleAvatar extends View {
    @:attribute var child:View;

    function render() {
		return hxx('
            <div class="circle-avatar">
                ${child}
            </div>
        ');
	}
}