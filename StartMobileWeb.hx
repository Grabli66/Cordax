import hxp.PlatformTools;
import hxp.Script;

/**
 * Start web
 */
@:keep
class StartMobileWeb extends Script {    
    public function new () {
        super();        
        PlatformTools.launchWebServer("test/mobile/www", 9091, true);
    }
}