package cordax.ui;

import coconut.ui.View;
import coconut.Ui.hxx;
import components.layouts.Column;

class Scaffold extends View {
    @:attribute var appBar:coconut.ui.View;
    @:attribute var drawer:coconut.ui.View = null;

    function render() {
        var column = new Column({
            childs: [
                appBar, drawer
            ]
        });

        return hxx('
            <div class="scaffold flex-1">
                ${column}
            </div>
        ');
    }
}