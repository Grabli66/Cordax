package mobile_web;

import cordax.Cordax;
import cordax.layouts.Column;
import cordax.ui.App;
import cordax.ui.View;
import cordax.ui.Text;
import cordax.ui.AppBar;
import cordax.ui.Button;

class MyApp extends View {
	var caption:String;
	var count:Int;
	var textModel:TextModel;

	public function new() {
		super();
		count = 1;
		textModel = new TextModel();
	}

	/**
	 * Render view layout from other views (childs)
	 */
	public override function render():View {
		caption = 'Clicked: ${count}';
		return new App({
			title: "App",
			appBar: new AppBar(),
			content: new Column({
				childs: [
					new Text({model: textModel, text: caption}),
					new Button({
						text: "Click me!",
						onClick: () -> {
							count += 1;
							textModel.text = 'Clicked: ${count}';
							textModel.apply();
						}
					})
				]
			})
		});
	}
}

class Main {
	/**
	 * Render app
	 */
	private function render() {
		Cordax.run(new MyApp());
	}

	/**
	 * Constructor
	 */
	public function new() {}

	/**
	 * Start application
	 */
	public function start() {
		render();
	}

	/**
	 * Entry point
	 */
	public static function main() {
		var app = new Main();
		app.start();
	}
}

// class Main {
// 	private var drawerModel:DrawerKey = new DrawerKey();
// 	private function render() {
// 		var app = new App({
// 			title: "Cordax",
// 			content: new Scaffold({
// 				appBar: new AppBar({
// 					leading: new IconButton({
// 						icon: "img/menu.svg",
// 						onclick: () -> {
// 							drawerModel.visible = true;
// 						}
// 					}),
// 					title: new Text({
// 						text: "Cordax app"
// 					})
// 				}),
// 				drawer: new Drawer({
// 					key: drawerModel,
// 					childs: [
// 						new SimpleDrawerHeader({
// 							photo: "img/avatar.png",
// 							name: "Donkey Kong",
// 							email: "donkey1988@gmail.com"
// 						}),
// 						new ListView({
// 							source: [
// 								new SimpleListViewItem({
// 									leading: new CircleAvatar({
// 										child: new Container({
// 											width: "30px",
// 											height: "30px",
// 											child: new Image({ src: "img/avatar.png" })
// 										})
// 									}),
// 									title: new Text({ text: "Monkey" })
// 								})
// 							],
// 							adapter: new SimpleListViewAdapter()
// 						})
// 					]
// 				})
// 			})
// 		});
// 		document.body.appendChild(app.toElement());
// 	}
// 	public function new() {}
// 	public function start() {
// 		document.addEventListener("deviceready", render, false);
// 	}
// 	public static function main() {
// 		var app = new Main();
// 		app.start();
// 	}
// }
