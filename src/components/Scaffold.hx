package components;

import coconut.ui.View;
import coconut.Ui.hxx;

class Scaffold extends View {
    @:attribute var appBar:coconut.ui.View;
    @:attribute var drawer:coconut.ui.View = null;

    function render() {
        return hxx('
            <div class="scaffold">
                ${appBar}
                <if {drawer != null}>
                    {drawer}
                </if>
            </div>
        ');
    }
}