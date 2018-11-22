package components;

import js.Browser.*;
import coconut.ui.View;
import coconut.Ui.hxx;

class App extends View {    
    @:attribute var title:String = "Cordax";
    @:attribute var content:coconut.ui.View;

    function render() {
        document.getElementsByTagName('title')[0].innerText = title;
        
        return hxx('
            <div class="application flex-1">
                ${content}
            </div>
        ');
    }
}