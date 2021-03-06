package cordax.util;

import haxe.crypto.Md5;

/**
 * Simple GUID generator
 */
class Guid {
	/**
	 * Generate unique ID
	 * @return String
	 */
	public static function generate():String {
		var result = "";

		for (j in 0...32) {
			if (j == 8 || j == 12 || j == 16 || j == 20) {
				result += "-";
			}

			result += StringTools.hex(Math.floor(Math.random() * 16));
		}

		return result.toUpperCase();
	}
}