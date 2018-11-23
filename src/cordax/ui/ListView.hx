package cordax.ui;

import vdom.VNode;
import coconut.ui.View;
import coconut.Ui.hxx;

/**
 * Adapter of items to VNode
 */
@:pure
interface IListViewAdapter {
	/**
	 * Render item to view
	 * @param item
	 * @return coconut.ui.View
	 */
	public function render(item:Dynamic):VNode;
}

typedef SimpleListViewItemParams = {
	@:optional var leading:View;
	@:optional var title:View;
	@:optional var actions:tink.pure.List<View>;
}

class SimpleListViewItem {
	public final leading:View;
	public final title:View;
	public final actions:tink.pure.List<View>;

	public function new(init:SimpleListViewItemParams) {
		this.leading = init.leading;
		this.title = init.title;
		this.actions = init.actions;
	}
}

class SimpleListViewAdapter implements IListViewAdapter {
	public function new() {}

	public function render(item:Dynamic):VNode {
		var it = cast(item, SimpleListViewItem);
		return hxx('
            <div class="list-view-simple-item">
                <if {it.leading != null}>
                    <div class="leading">${it.leading}</div>
                </if>
                <if {it.title != null}>
                    <div class="title">${it.title}</div>
                </if>
            </div>
		');
	}
}

class ListView extends View {
	/**
	 * Source items
	 */
	@:attribute var source:tink.pure.List<Dynamic>;

	/**
	 * Render source items to view
	 */
	@:attribute var adapter:IListViewAdapter;

	function render() {
		return hxx('
            <div class="listview">
                <for {item in source}>
                    ${adapter.render(item)}
                </for>
            </div>
        ');
	}
}
