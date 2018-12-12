package components.ui.layouts;

/**
 * Flex cross axis align settings
 */
@:enum
abstract CrossAxisAlignSetting(String) from String to String {
    var None = "none";
    var Normal = "normal";    
    var Center = "center";
    var FlexStart = "flex-start";
    var FlexEnd = "flex-end";
}

/**
 * Flex main axis align settings
 */
@:enum
abstract MainAxisAlignSetting(String) from String to String {
    var None = "none";
    var Normal = "normal";
    var Center = "center";
    var FlexStart = "flex-start";
    var FlexEnd = "flex-end";

    /**
     * The items are evenly distributed within the alignment container along the main axis. 
     * The spacing between each pair of adjacent items is the same. 
     * The first item is flush with the main-start edge, and the last item is flush with the main-end edge.
     */
    var spaceBetween = "space-between";
}