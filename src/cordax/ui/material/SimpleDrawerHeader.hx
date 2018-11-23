package cordax.ui;

import coconut.ui.View;
import coconut.Ui.hxx;

import cordax.ui.CircleAvatar;
import cordax.ui.Image;
import cordax.ui.Text;
import cordax.ui.layouts.Padding;
import cordax.ui.layouts.Container;
import cordax.ui.layouts.Column;

/**
 * Simple header with photo, user name and email
 */
@:less("simple-drawer-header.less")
class SimpleDrawerHeader extends View {
	@:attribute var photo:String;
	@:attribute var name:String;
	@:attribute var email:String;
	@:attribute var actions:tink.pure.List<coconut.ui.View> = null;

	function render() {
		var content = new Padding({
			padding: PaddingSettings.all(16),
			child: new Column({
				childs: [
					new Padding({
						padding: new PaddingSettings({bottom: 14}),
						child: new Container({
							width: "64px",
							height: "64px",
							child: new CircleAvatar({
								child: new Image({src: photo})
							})
						})
					}),
					new Text({text: name}),
					new Text({text: email})
				]
			})
		});

		return hxx('
            <div class="drawer-simple-header">
                ${content}
            </div>
        ');
	}
}
/**
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
 */
