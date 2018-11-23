package cordax.ui;

import coconut.ui.View;
import coconut.Ui.hxx;

import cordax.layouts.AxisAlignSetting;
import cordax.layouts.Row;
import cordax.layouts.Padding;
import cordax.layouts.Container;
import cordax.layouts.Center;

class AppBar extends View {
	@:attribute var leading:coconut.ui.View = null;
	@:attribute var title:coconut.ui.View = null;
	@:attribute var actions:coconut.ui.View = null;

	function render() {
		var child = new Padding({
			padding: new PaddingSettings({
				left: 16,
				right: 16
			}),
			child: new Row({
				crossAxisAlign: CrossAxisAlignSetting.Center,
				childs: [leading, new Center({
					child: title
				}), actions]
			})
		});
		return hxx('
			<div class="app-bar">
           		${child}
			</div>
        ');
	}
}
