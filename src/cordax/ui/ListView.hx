package cordax.ui;

import cordax.util.Guid;
import cordax.native.elements.LayoutElement;
import cordax.native.elements.Element;
import cordax.native.elements.RootElement;

/**
 * List item
 */
class ListItem {
    /**
     * List item id
     */
    public final id:String;

    /**
     * List item value
     */
    public var value:Dynamic;

    /**
     * Constructor
     */
    public function new(value:Dynamic) {
        id = Guid.generate();
        this.value = value;
    }
}

/**
 * Data source
 */
interface IListDataSource {
    /**
     * Callback on append item
     */
    public var onAppendItem:(ListItem) -> Void;

    /**
     * Callback on remove item
     */
    public var onRemoveItem:(ListItem) -> Void;

    /**
     * Get all data
     * @return Array<ListItem>
     */
    public function getData():Array<ListItem>;
}

/**
 * Simple
 */
class ListDataSource implements IListDataSource {
    /**
     * List items
     */
    private final items:Array<ListItem>;

    /**
     * Callback on append item
     */
    public var onAppendItem:(ListItem) -> Void;

    /**
     * Callback on remove item
     */
    public var onRemoveItem:(ListItem) -> Void;

    /**
     * Create datasource from array
     */
    public static function fromArray(data:Array<Dynamic>) : ListDataSource {
        var res = new Array<ListItem>();
        for (item in data) {
            res.push(new ListItem(item));
        }

        return new ListDataSource(res);
    }

    /**
     * Constructor
     */
    public function new(items:Array<ListItem>) {
        this.items = items;
    }    

    /**
     * Get all data
     * @return Array<Dynamic>
     */
    public function getData():Array<ListItem> {
        return items;
    }    
}

/**
 * List view settings
 */
typedef ListViewSettings = {
	/**
	 * List view item adapter
	 */
	var builder:(ListItem) -> View;

    /**
     * List view data source
     */
    var source:IListDataSource;
}

/**
 * List with items
 */
class ListView extends View {
    /**
     * Settings
     */
    private var settings:ListViewSettings;

	/**
	 * Constructor
	 */
	public function new(settings:ListViewSettings) {
		super();
        this.settings = settings;
	}

	/**
	 * Convert view to element
	 */
	public override function toElement() {
		var attachElement:LayoutElement = new LayoutElement("listview-content");
		var root = new RootElement(this, attachElement, true);

        var items = settings.source.getData();
        for (item in items) {
            var child = settings.builder(item);
            attachElement.addChild(child.toElement());
        }

		return root;
	}
}
