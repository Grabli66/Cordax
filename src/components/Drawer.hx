package components;

import coconut.ui.View;
import coconut.ui.Children;
import coconut.Ui.hxx;
import coconut.data.Model;

class DrawerKey implements Model {
    @:editable var visible:Bool = @byDefault false;
}

class Drawer extends View {
    @:attribute var key:DrawerKey = new DrawerKey();
    @:attribute var childs:tink.pure.List<coconut.ui.View> = null;

    function render() {
        var style = if (key.visible) {
            "display: flex";
        } else {
            "display: none";
        }

        return hxx('
            <div class="drawer" style=${style}>
                <div class="content">
                    <if {childs != null}>
                        <for {child in childs}>
                            ${child}
                        </for>
                    </if>
                </div>
                <div class="overflow" onclick=${key.visible = false}>
                </div>
            </div>
        ');
    }
}