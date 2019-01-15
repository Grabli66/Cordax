package cordax.util;

#if macro
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import sys.FileSystem;
import sys.io.File;
#end

class FileUtil {
    public static macro function getFileText(path:String):ExprOf<String> {
        var content = File.getContent(path);
        return macro $v{content};
    }
}