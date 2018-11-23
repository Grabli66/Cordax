package cordax.ui;

import coconut.ui.View;
import coconut.Ui.hxx;

class IconButton extends View {
    @:attribute var icon:String;
    @:attribute var onclick:()->Void;

    function render() {
        return hxx('
            <img class="icon-button" src=${icon} onclick=${onclick} />                            
        ');
    }
}