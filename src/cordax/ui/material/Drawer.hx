package cordax.ui;

import coconut.ui.View;
import coconut.ui.Children;
import coconut.Ui.hxx;
import coconut.data.Model;

import cordax.layouts.Container;
import cordax.layouts.Column;

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

		var child = new Container({
            width: "300px",
			child: new Column({
				childs: childs
			})
		});

		return hxx('
            <div class="drawer" style=${style}>
                ${child}
                <div class="overflow" onclick=${key.visible = false}>
                </div>
            </div>
        ');
	}
}

/**

	<div class="content">
						<if {childs != null}>
							<for {child in childs}>
								${child}
							</for>
						</if>
					</div>
					<div class="overflow" onclick=${key.visible = false}>
					</div>

 */
