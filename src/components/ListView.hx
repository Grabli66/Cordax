package components;

import coconut.ui.View;
import coconut.Ui.hxx;

class ListView extends View {    
    function render() {
        return hxx('
            <div class="listview">
                ListView
            </div>
        ');
    }
}