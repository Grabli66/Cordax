package mobile_web;

import cordax.ui.Dialog.SimpleDialog;
import cordax.Cordax;
import cordax.ui.layouts.Column;
import cordax.ui.App;
import cordax.ui.View;
import cordax.ui.Text;
import cordax.ui.Scaffold;
import cordax.ui.AppBar;
import cordax.ui.Button;

class MyApp extends App {
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
		return new Scaffold({
			title: "App",
			appBar: new AppBar({
				title: new Text({text: "Test app"})
			}),
			content: new Column({
				childs: [
					new Text({model: textModel, text: caption}),
					new Button({
						text: "Click me!",
						onClick: () -> {
							count += 1;
							caption = 'Clicked: ${count}';
							// showDialog({
							// 	builder: () -> {
							// 		new SimpleDialog({
							// 			title: new Text({text: "Users"}),
							// 			content: new Text({text: "Hello"})
							// 		});
							// 	},
							// 	onClose: () -> {
							// 		trace("CLOSE DIALOG");
							// 	}
							// });
							textModel.text = 'Clicked: ${count}';
							textModel.apply();
							setState();
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
