package cordax.ui;

import cordax.native.elements.TextElement;
import cordax.ui.View.ViewModel;
import cordax.native.elements.RootElement;
import cordax.native.elements.Builder.*;

typedef TextSettings = {    
    @:optional var model:TextModel;
    var text:String;
}

/**
 * Model for text view
 */
class TextModel extends ViewModel {
    /**
     * Text
     */
    public var text(default, set):String;

    public function set_text(value:String):String {
        notify("text", value);
        return text = value;
    }

    /**
     * Constructor
     */
    public function new() {}
}

/**
 * Text component
 */
class Text extends View {
    /**
     * Text element
     */
    private var textElement:TextElement;

    /**
     * Settings
     */
    public var settings:TextSettings;

    /**
     * Constructor
     * @param init 
     */
    public function new(settings:TextSettings) {
        super();        
        this.settings = settings;
        if (this.settings.model != null) {
            this.settings.model.onChange = (changed) -> {
                if (textElement == null) 
                    return;

                for (changeKey in changed.keys()) {
                    var value = changed[changeKey];
                    switch (changeKey) {
                        case "text":
                            textElement.text = value;
                    }
                }

                textElement.update();                
            };
        }
    }

    /**
	 * Convert view to element
	 */
	public override function toElement():RootElement {
        return root({
            view: this,
            attachment: textElement = text({
                name: "text",
                text: settings.text
            })
        });
    }
}