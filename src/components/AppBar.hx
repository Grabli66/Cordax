package components;

import coconut.ui.View;
import coconut.Ui.hxx;
import components.layouts.Row;
import components.layouts.Padding;
import components.layouts.Container;

class AppBar extends View {
	@:attribute var leading:coconut.ui.View = null;
	@:attribute var title:coconut.ui.View = null;
	@:attribute var actions:coconut.ui.View = null;

	function render() {
		var row = new Container({
			height: "40px",
			child: new Padding({
				child: new Row({
					childs: [leading, title, actions]
				}),
				padding: new PaddingSettings({
					left: 8,
					right: 8
				})
			})
		});
		return hxx('
			<div class="app-bar flex-1">
           		${row}
			</div>
        ');

	}
}
