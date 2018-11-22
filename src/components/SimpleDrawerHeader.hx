package components;

import coconut.ui.View;
import coconut.Ui.hxx;

/**
 * Simple header with photo, user name and email
 */
class SimpleDrawerHeader extends View {
    @:attribute var photo:String;
    @:attribute var name:String;
    @:attribute var email:String;

    @:attribute var actions:tink.pure.List<coconut.ui.View> = null;

    function render() {
        return hxx('
            <div class="drawer-simple-header">
                <div class="inner">
                    <div class="panel">
                        <img class="photo" src="${photo}" />
                        <div class="action-panel">
                            <if {actions != null}>
                                <for {action in actions}>
                                    ${action}
                                </for>
                            </if>
                        </div>
                    </div>
                    <div class="name">${name}</div>
                    <div class="email">${email}</div>
                </div>
            </div>
        ');
    }
}