package cordax.ui.layouts;

typedef PaddingSettings = {
    @:optional var Top:String;
    @:optional var Right:String;
    @:optional var Bottom:String;
    @:optional var Left:String; 
}

/**
 * Padding view
 */
class Padding extends View {
    /**
     * Settings
     */
    public var settings:PaddingSettings;

    /**
     * Constructor
     */
    public function new(settings:PaddingSettings) {
        super();
        this.settings = settings;
    }
}