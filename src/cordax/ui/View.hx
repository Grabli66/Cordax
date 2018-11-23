package cordax.ui;

typedef StyleSettings = {
    @:optional var css:String;
}

typedef ChildSettings = {
    @:optional var child:View;
}

typedef ViewSettings = { >StyleSettings,
    var name:String;
    @:optional var childs:Array<View>;
}

/**
 * Base view
 */
class View {
    /**
     * View settings
     */
    public var settings:ViewSettings;

    /**
     * Constructor
     */
    public function new(init:ViewSettings) {
        settings = init;
    }

    /**
     * Render view to native element
     */
    function render():View {
        throw "Not implemented";
    }

    /**
     * Make element for view     
     */
    public function toElement():NativeElement {
        var renderedView = render();
        var renderedElement = renderedView.toElement();        

        return new NativeElement({
            name: settings.name,
            childs: []
        });
    }
}