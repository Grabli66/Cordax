package components;

import coconut.ui.View;
import coconut.Ui.hxx;

class AppBar extends View {
    @:attribute var leading:coconut.ui.View = null;
    @:attribute var title:coconut.ui.View = null;
    @:attribute var actions:coconut.ui.View = null;

    function render() {
        return hxx('
            <div class="app-bar">
                <if {leading != null}>
                    <div class="leading">${leading}</div>
                </if>                
                <if {title != null}>
                    <div class="title">${title}</div>
                </if>
                <if {leading != null}>
                    <div class="actions">${actions}</div>
                </if>
            </div>
        ');
    }
}