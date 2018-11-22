package components;

import coconut.ui.View;

class CircleAvatar extends View {
    @:attribute var content:View;

    function render() {
		return hxx('
            <div class="circle-avatar">
                ${content}
            </div>
        ');
	}
}