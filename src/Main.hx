import js.html.*;
import js.Browser.*;
import coconut.Ui.hxx;
import components.App;
import components.Scaffold;
import components.AppBar;
import components.IconButton;
import components.Drawer;
import components.SimpleDrawerHeader;
import components.ListView;

class Main {
    private var drawerModel:DrawerKey = new DrawerKey();

	private function render() {
		var app = new App({
			title: "Test Cordax",
			content: new Scaffold({
				appBar: new AppBar({
					leading: new IconButton({
						icon: "img/menu.svg",
						onclick: () -> {
                            drawerModel.visible = true;
                        }
					}),
					title: "Simple app"
				}),
				drawer: new Drawer({
					key: drawerModel,
					childs: [new SimpleDrawerHeader({
                        photo: "img/avatar.png",
                        name: "Donkey Kong",
                        email: "donkey1988@gmail.com"
                    }), new ListView({})]
				})
			})
		});

		document.body.appendChild(app.toElement());
	}

	public function new() {}

	public function start() {
		document.addEventListener("deviceready", render, false);
	}

	public static function main() {
		var app = new Main();
		app.start();
	}
}
