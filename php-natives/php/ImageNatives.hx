package php;

class ImageNatives
{
	/**
	 * The GD version PHP was compiled against. (Available as of PHP 5.2.4) 
	 */
	public static var GD_VERSION(get, never) : String; private static inline function get_GD_VERSION() : String return untyped __php__("GD_VERSION");

	/**
	 * The GD major version PHP was compiled against. (Available as of PHP 5.2.4) 
	 */
	public static var GD_MAJOR_VERSION(get, never) : Int; private static inline function get_GD_MAJOR_VERSION() : Int return untyped __php__("GD_MAJOR_VERSION");

	/**
	 * The GD minor version PHP was compiled against. (Available as of PHP 5.2.4) 
	 */
	public static var GD_MINOR_VERSION(get, never) : Int; private static inline function get_GD_MINOR_VERSION() : Int return untyped __php__("GD_MINOR_VERSION");

	/**
	 * The GD release version PHP was compiled against. (Available as of PHP 5.2.4) 
	 */
	public static var GD_RELEASE_VERSION(get, never) : Int; private static inline function get_GD_RELEASE_VERSION() : Int return untyped __php__("GD_RELEASE_VERSION");

	/**
	 * The GD "extra" version (beta/rc..) PHP was compiled against. (Available as of PHP 5.2.4) 
	 */
	public static var GD_EXTRA_VERSION(get, never) : String; private static inline function get_GD_EXTRA_VERSION() : String return untyped __php__("GD_EXTRA_VERSION");

	/**
	 * When the bundled version of GD is used this is 1 otherwise its set to 0. 
	 */
	public static var GD_BUNDLED(get, never) : Int; private static inline function get_GD_BUNDLED() : Int return untyped __php__("GD_BUNDLED");

	/**
	 * Used as a return value by imagetypes() 
	 */
	public static var IMG_GIF(get, never) : Int; private static inline function get_IMG_GIF() : Int return untyped __php__("IMG_GIF");

	/**
	 * Used as a return value by imagetypes() 
	 */
	public static var IMG_JPG(get, never) : Int; private static inline function get_IMG_JPG() : Int return untyped __php__("IMG_JPG");

	/**
	 * Used as a return value by imagetypes()
	 */
	public static var IMG_JPEG(get, never) : Int; private static inline function get_IMG_JPEG() : Int return untyped __php__("IMG_JPEG");

	/**
	 * Used as a return value by imagetypes() 
	 */
	public static var IMG_PNG(get, never) : Int; private static inline function get_IMG_PNG() : Int return untyped __php__("IMG_PNG");

	/**
	 * Used as a return value by imagetypes() 
	 */
	public static var IMG_WBMP(get, never) : Int; private static inline function get_IMG_WBMP() : Int return untyped __php__("IMG_WBMP");

	/**
	 * Used as a return value by imagetypes() 
	 */
	public static var IMG_XPM(get, never) : Int; private static inline function get_IMG_XPM() : Int return untyped __php__("IMG_XPM");

	/**
	 * Special color option which can be used in stead of color allocated with imagecolorallocate() or imagecolorallocatealpha() 
	 */
	public static var IMG_COLOR_TILED(get, never) : Int; private static inline function get_IMG_COLOR_TILED() : Int return untyped __php__("IMG_COLOR_TILED");

	/**
	 * Special color option which can be used in stead of color allocated with imagecolorallocate() or imagecolorallocatealpha() 
	 */
	public static var IMG_COLOR_STYLED(get, never) : Int; private static inline function get_IMG_COLOR_STYLED() : Int return untyped __php__("IMG_COLOR_STYLED");

	/**
	 * Special color option which can be used in stead of color allocated with imagecolorallocate() or imagecolorallocatealpha() 
	 */
	public static var IMG_COLOR_BRUSHED(get, never) : Int; private static inline function get_IMG_COLOR_BRUSHED() : Int return untyped __php__("IMG_COLOR_BRUSHED");

	/**
	 * Special color option which can be used in stead of color allocated with imagecolorallocate() or imagecolorallocatealpha() 
	 */
	public static var IMG_COLOR_STYLEDBRUSHED(get, never) : Int; private static inline function get_IMG_COLOR_STYLEDBRUSHED() : Int return untyped __php__("IMG_COLOR_STYLEDBRUSHED");

	/**
	 * Special color option which can be used in stead of color allocated with imagecolorallocate() or imagecolorallocatealpha() 
	 */
	public static var IMG_COLOR_TRANSPARENT(get, never) : Int; private static inline function get_IMG_COLOR_TRANSPARENT() : Int return untyped __php__("IMG_COLOR_TRANSPARENT");

	/**
	 * A style constant used by the imagefilledarc() function.
	 */
	public static var IMG_ARC_ROUNDED(get, never) : Int; private static inline function get_IMG_ARC_ROUNDED() : Int return untyped __php__("IMG_ARC_ROUNDED");

	/**
	 * A style constant used by the imagefilledarc() function. 
	 */
	public static var IMG_ARC_PIE(get, never) : Int; private static inline function get_IMG_ARC_PIE() : Int return untyped __php__("IMG_ARC_PIE");

	/**
	 * A style constant used by the imagefilledarc() function. 
	 */
	public static var IMG_ARC_CHORD(get, never) : Int; private static inline function get_IMG_ARC_CHORD() : Int return untyped __php__("IMG_ARC_CHORD");

	/**
	 * A style constant used by the imagefilledarc() function. 
	 */
	public static var IMG_ARC_NOFILL(get, never) : Int; private static inline function get_IMG_ARC_NOFILL() : Int return untyped __php__("IMG_ARC_NOFILL");

	/**
	 * A style constant used by the imagefilledarc() function. 
	 */
	public static var IMG_ARC_EDGED(get, never) : Int; private static inline function get_IMG_ARC_EDGED() : Int return untyped __php__("IMG_ARC_EDGED");

	/**
	 * A type constant used by the imagegd2() function. 
	 */
	public static var IMG_GD2_RAW(get, never) : Int; private static inline function get_IMG_GD2_RAW() : Int return untyped __php__("IMG_GD2_RAW");

	/**
	 * A type constant used by the imagegd2() function. 
	 */
	public static var IMG_GD2_COMPRESSED(get, never) : Int; private static inline function get_IMG_GD2_COMPRESSED() : Int return untyped __php__("IMG_GD2_COMPRESSED");

	/**
	 * Alpha blending effect used by the imagelayereffect() function. 
	 */
	public static var IMG_EFFECT_REPLACE(get, never) : Int; private static inline function get_IMG_EFFECT_REPLACE() : Int return untyped __php__("IMG_EFFECT_REPLACE");

	/**
	 * Alpha blending effect used by the imagelayereffect() function. 
	 */
	public static var IMG_EFFECT_ALPHABLEND(get, never) : Int; private static inline function get_IMG_EFFECT_ALPHABLEND() : Int return untyped __php__("IMG_EFFECT_ALPHABLEND");

	/**
	 * Alpha blending effect used by the imagelayereffect() function. 
	 */
	public static var IMG_EFFECT_NORMAL(get, never) : Int; private static inline function get_IMG_EFFECT_NORMAL() : Int return untyped __php__("IMG_EFFECT_NORMAL");

	/**
	 * Alpha blending effect used by the imagelayereffect() function. 
	 */
	public static var IMG_EFFECT_OVERLAY(get, never) : Int; private static inline function get_IMG_EFFECT_OVERLAY() : Int return untyped __php__("IMG_EFFECT_OVERLAY");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_NEGATE(get, never) : Int; private static inline function get_IMG_FILTER_NEGATE() : Int return untyped __php__("IMG_FILTER_NEGATE");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_GRAYSCALE(get, never) : Int; private static inline function get_IMG_FILTER_GRAYSCALE() : Int return untyped __php__("IMG_FILTER_GRAYSCALE");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_BRIGHTNESS(get, never) : Int; private static inline function get_IMG_FILTER_BRIGHTNESS() : Int return untyped __php__("IMG_FILTER_BRIGHTNESS");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_CONTRAST(get, never) : Int; private static inline function get_IMG_FILTER_CONTRAST() : Int return untyped __php__("IMG_FILTER_CONTRAST");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_COLORIZE(get, never) : Int; private static inline function get_IMG_FILTER_COLORIZE() : Int return untyped __php__("IMG_FILTER_COLORIZE");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_EDGEDETECT(get, never) : Int; private static inline function get_IMG_FILTER_EDGEDETECT() : Int return untyped __php__("IMG_FILTER_EDGEDETECT");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_GAUSSIAN_BLUR(get, never) : Int; private static inline function get_IMG_FILTER_GAUSSIAN_BLUR() : Int return untyped __php__("IMG_FILTER_GAUSSIAN_BLUR");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_SELECTIVE_BLUR(get, never) : Int; private static inline function get_IMG_FILTER_SELECTIVE_BLUR() : Int return untyped __php__("IMG_FILTER_SELECTIVE_BLUR");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_EMBOSS(get, never) : Int; private static inline function get_IMG_FILTER_EMBOSS() : Int return untyped __php__("IMG_FILTER_EMBOSS");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_MEAN_REMOVAL(get, never) : Int; private static inline function get_IMG_FILTER_MEAN_REMOVAL() : Int return untyped __php__("IMG_FILTER_MEAN_REMOVAL");

	/**
	 * Special GD filter used by the imagefilter() function. 
	 */
	public static var IMG_FILTER_SMOOTH(get, never) : Int; private static inline function get_IMG_FILTER_SMOOTH() : Int return untyped __php__("IMG_FILTER_SMOOTH");

	/**
	 * Special GD filter used by the imagefilter() function. (Available as of PHP 5.3.0) 
	 */
	public static var IMG_FILTER_PIXELATE(get, never) : Int; private static inline function get_IMG_FILTER_PIXELATE() : Int return untyped __php__("IMG_FILTER_PIXELATE");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_GIF(get, never) : Int; private static inline function get_IMAGETYPE_GIF() : Int return untyped __php__("IMAGETYPE_GIF");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JPEG(get, never) : Int; private static inline function get_IMAGETYPE_JPEG() : Int return untyped __php__("IMAGETYPE_JPEG");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JPEG2000(get, never) : Int; private static inline function get_IMAGETYPE_JPEG2000() : Int return untyped __php__("IMAGETYPE_JPEG2000");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_PNG(get, never) : Int; private static inline function get_IMAGETYPE_PNG() : Int return untyped __php__("IMAGETYPE_PNG");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_SWF(get, never) : Int; private static inline function get_IMAGETYPE_SWF() : Int return untyped __php__("IMAGETYPE_SWF");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_PSD(get, never) : Int; private static inline function get_IMAGETYPE_PSD() : Int return untyped __php__("IMAGETYPE_PSD");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_BMP(get, never) : Int; private static inline function get_IMAGETYPE_BMP() : Int return untyped __php__("IMAGETYPE_BMP");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_WBMP(get, never) : Int; private static inline function get_IMAGETYPE_WBMP() : Int return untyped __php__("IMAGETYPE_WBMP");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_XBM(get, never) : Int; private static inline function get_IMAGETYPE_XBM() : Int return untyped __php__("IMAGETYPE_XBM");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_TIFF_II(get, never) : Int; private static inline function get_IMAGETYPE_TIFF_II() : Int return untyped __php__("IMAGETYPE_TIFF_II");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_TIFF_MM(get, never) : Int; private static inline function get_IMAGETYPE_TIFF_MM() : Int return untyped __php__("IMAGETYPE_TIFF_MM");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_IFF(get, never) : Int; private static inline function get_IMAGETYPE_IFF() : Int return untyped __php__("IMAGETYPE_IFF");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JB2(get, never) : Int; private static inline function get_IMAGETYPE_JB2() : Int return untyped __php__("IMAGETYPE_JB2");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JPC(get, never) : Int; private static inline function get_IMAGETYPE_JPC() : Int return untyped __php__("IMAGETYPE_JPC");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JP2(get, never) : Int; private static inline function get_IMAGETYPE_JP2() : Int return untyped __php__("IMAGETYPE_JP2");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_JPX(get, never) : Int; private static inline function get_IMAGETYPE_JPX() : Int return untyped __php__("IMAGETYPE_JPX");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. 
	 */
	public static var IMAGETYPE_SWC(get, never) : Int; private static inline function get_IMAGETYPE_SWC() : Int return untyped __php__("IMAGETYPE_SWC");

	/**
	 * Image type constant used by the image_type_to_mime_type() and image_type_to_extension() functions. (Available as of PHP 5.3.0) 
	 */
	public static var IMAGETYPE_ICO(get, never) : Int; private static inline function get_IMAGETYPE_ICO() : Int return untyped __php__("IMAGETYPE_ICO");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_NO_FILTER(get, never) : Int; private static inline function get_PNG_NO_FILTER() : Int return untyped __php__("PNG_NO_FILTER");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_FILTER_NONE(get, never) : Int; private static inline function get_PNG_FILTER_NONE() : Int return untyped __php__("PNG_FILTER_NONE");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_FILTER_SUB(get, never) : Int; private static inline function get_PNG_FILTER_SUB() : Int return untyped __php__("PNG_FILTER_SUB");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_FILTER_UP(get, never) : Int; private static inline function get_PNG_FILTER_UP() : Int return untyped __php__("PNG_FILTER_UP");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_FILTER_AVG(get, never) : Int; private static inline function get_PNG_FILTER_AVG() : Int return untyped __php__("PNG_FILTER_AVG");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_FILTER_PAETH(get, never) : Int; private static inline function get_PNG_FILTER_PAETH() : Int return untyped __php__("PNG_FILTER_PAETH");

	/**
	 * A special PNG filter, used by the imagepng() function. 
	 */
	public static var PNG_ALL_FILTERS(get, never) : Int; private static inline function get_PNG_ALL_FILTERS() : Int return untyped __php__("PNG_ALL_FILTERS");

	/**
	 * Used together with imageflip(), available as of PHP 5.5.0. 
	 */
	public static var IMG_FLIP_VERTICAL(get, never) : Int; private static inline function get_IMG_FLIP_VERTICAL() : Int return untyped __php__("IMG_FLIP_VERTICAL");

	/**
	 * Used together with imageflip(), available as of PHP 5.5.0. 
	 */
	public static var IMG_FLIP_HORIZONTAL(get, never) : Int; private static inline function get_IMG_FLIP_HORIZONTAL() : Int return untyped __php__("IMG_FLIP_HORIZONTAL");

	/**
	 * Used together with imageflip(), available as of PHP 5.5.0. 
	 */
	public static var IMG_FLIP_BOTH(get, never) : Int; private static inline function get_IMG_FLIP_BOTH() : Int return untyped __php__("IMG_FLIP_BOTH");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BELL(get, never) : Int; private static inline function get_IMG_BELL() : Int return untyped __php__("IMG_BELL");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BESSEL(get, never) : Int; private static inline function get_IMG_BESSEL() : Int return untyped __php__("IMG_BESSEL");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BILINEAR_FIXED(get, never) : Int; private static inline function get_IMG_BILINEAR_FIXED() : Int return untyped __php__("IMG_BILINEAR_FIXED");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BICUBIC(get, never) : Int; private static inline function get_IMG_BICUBIC() : Int return untyped __php__("IMG_BICUBIC");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BLACKMAN(get, never) : Int; private static inline function get_IMG_BLACKMAN() : Int return untyped __php__("IMG_BLACKMAN");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BOX(get, never) : Int; private static inline function get_IMG_BOX() : Int return untyped __php__("IMG_BOX");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_BSPLINE(get, never) : Int; private static inline function get_IMG_BSPLINE() : Int return untyped __php__("IMG_BSPLINE");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_CATMULLROM(get, never) : Int; private static inline function get_IMG_CATMULLROM() : Int return untyped __php__("IMG_CATMULLROM");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_GAUSSIAN(get, never) : Int; private static inline function get_IMG_GAUSSIAN() : Int return untyped __php__("IMG_GAUSSIAN");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_GENERALIZED_CUBIC(get, never) : Int; private static inline function get_IMG_GENERALIZED_CUBIC() : Int return untyped __php__("IMG_GENERALIZED_CUBIC");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_HERMITE(get, never) : Int; private static inline function get_IMG_HERMITE() : Int return untyped __php__("IMG_HERMITE");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_HAMMING(get, never) : Int; private static inline function get_IMG_HAMMING() : Int return untyped __php__("IMG_HAMMING");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_HANNING(get, never) : Int; private static inline function get_IMG_HANNING() : Int return untyped __php__("IMG_HANNING");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_MITCHELL(get, never) : Int; private static inline function get_IMG_MITCHELL() : Int return untyped __php__("IMG_MITCHELL");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_POWER(get, never) : Int; private static inline function get_IMG_POWER() : Int return untyped __php__("IMG_POWER");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_QUADRATIC(get, never) : Int; private static inline function get_IMG_QUADRATIC() : Int return untyped __php__("IMG_QUADRATIC");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_SINC(get, never) : Int; private static inline function get_IMG_SINC() : Int return untyped __php__("IMG_SINC");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_NEAREST_NEIGHBOUR(get, never) : Int; private static inline function get_IMG_NEAREST_NEIGHBOUR() : Int return untyped __php__("IMG_NEAREST_NEIGHBOUR");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_WEIGHTED4(get, never) : Int; private static inline function get_IMG_WEIGHTED4() : Int return untyped __php__("IMG_WEIGHTED4");

	/**
	 * Used together with imagesetinterpolation(), available as of PHP 5.5.0. 
	 */
	public static var IMG_TRIANGLE(get, never) : Int; private static inline function get_IMG_TRIANGLE() : Int return untyped __php__("IMG_TRIANGLE");
	
	
	public static inline function gd_info() : TypedArray<String, Dynamic> return untyped __call__('gd_info');
	
	public static function getimagesize(filename:String, ?imageinfo:NativeArray) : NativeArray
	{
		if (imageinfo == null)
		{
			return untyped __call__('getimagesize', filename);
		}
		else
		{
			return untyped __call__('getimagesize', filename, imageinfo);
		}
	}
	
	public static function getimagesizefromstring(imagedata:String, ?imageinfo:NativeArray) : NativeArray
	{
		if (imageinfo == null)
		{
			return untyped __call__('getimagesizefromstring', imagedata);
		}
		else
		{
			return untyped __call__('getimagesizefromstring', imagedata, imageinfo);
		}
	}
	
	public static inline function image_type_to_extension(imagetype:Int, ?include_dot:Bool=true) : String return untyped __call__('image_type_to_extension', imagetype, include_dot);
	
	public static inline function image_type_to_mime_type(imagetype:Int) : String return untyped __call__('image_type_to_mime_type', imagetype);
	
	public static function image2wbmp(image:Resource, ?filename:String, ?threshold:Int) : Bool
	{
		if (threshold == null)
		{
			if (filename == null)
			{
				return untyped __call__('image2wbmp', image);
			}
			else
			{
				return untyped __call__('image2wbmp', image, filename);
			}
		}
		else
		{
			return untyped __call__('image2wbmp', image, filename, threshold);
		}
	}
	
	public static function imageaffine(image:Resource, affine:NativeArray, ?clip:NativeArray) : Resource
	{
		if (clip == null)
		{
			return untyped __call__('imageaffine', image, affine);
		}
		else
		{
			return untyped __call__('imageaffine', image, affine, clip);
		}
	}
	
	public static inline function imageaffinematrixconcat(m1:NativeArray, m2:NativeArray) : NativeArray return untyped __call__('imageaffinematrixconcat', m1, m2);
	
	public static function imageaffinematrixget(type:Int, ?options:Dynamic) : NativeArray
	{
		if (options == null)
		{
			return untyped __call__('imageaffinematrixget', type);
		}
		else
		{
			return untyped __call__('imageaffinematrixget', type, options);
		}
	}
	
	public static inline function imagealphablending(image:Resource, blendmode:Bool) : Bool return untyped __call__('imagealphablending', image, blendmode);
	
	public static inline function imageantialias(image:Resource, enabled:Bool) : Bool return untyped __call__('imageantialias', image, enabled);
	
	public static inline function imagearc(image:Resource, cx:Int, cy:Int, width:Int, height:Int, start:Int, end:Int, color:Int) : Bool return untyped __call__('imagearc', image, cx, cy, width, height, start, end, color);
	
	public static inline function imagechar(image:Resource, font:Int, x:Int, y:Int, c:String, color:Int) : Bool return untyped __call__('imagechar', image, font, x, y, c, color);
	
	public static inline function imagecharup(image:Resource, font:Int, x:Int, y:Int, c:String, color:Int) : Bool return untyped __call__('imagecharup', image, font, x, y, c, color);
	
	public static inline function imagecolorallocate(image:Resource, red:Int, green:Int, blue:Int) : Int return untyped __call__('imagecolorallocate', image, red, green, blue);
	
	public static inline function imagecolorallocatealpha(image:Resource, red:Int, green:Int, blue:Int, alpha:Int) : Int return untyped __call__('imagecolorallocatealpha', image, red, green, blue, alpha);
	
	public static inline function imagecolorat(image:Resource, x:Int, y:Int) : Int return untyped __call__('imagecolorat', image, x, y);
	
	public static inline function imagecolorclosest(image:Resource, red:Int, green:Int, blue:Int) : Int return untyped __call__('imagecolorclosest', image, red, green, blue);
	
	public static inline function imagecolorclosestalpha(image:Resource, red:Int, green:Int, blue:Int, alpha:Int) : Int return untyped __call__('imagecolorclosestalpha', image, red, green, blue, alpha);
	
	public static inline function imagecolorclosesthwb(image:Resource, red:Int, green:Int, blue:Int) : Int return untyped __call__('imagecolorclosesthwb', image, red, green, blue);
	
	public static inline function imagecolordeallocate(image:Resource, color:Int) : Bool return untyped __call__('imagecolordeallocate', image, color);
	
	public static inline function imagecolorexact(image:Resource, red:Int, green:Int, blue:Int) : Int return untyped __call__('imagecolorexact', image, red, green, blue);
	
	public static inline function imagecolorexactalpha(image:Resource, red:Int, green:Int, blue:Int, alpha:Int) : Int return untyped __call__('imagecolorexactalpha', image, red, green, blue, alpha);
	
	public static inline function imagecolormatch(image1:Resource, image2:Resource) : Bool return untyped __call__('imagecolormatch', image1, image2);
	
	public static inline function imagecolorresolve(image:Resource, red:Int, green:Int, blue:Int) : Int return untyped __call__('imagecolorresolve', image, red, green, blue);
	
	public static inline function imagecolorresolvealpha(image:Resource, red:Int, green:Int, blue:Int, alpha:Int) : Int return untyped __call__('imagecolorresolvealpha', image, red, green, blue, alpha);
	
	public static inline function imagecolorset(image:Resource, index:Int, red:Int, green:Int, blue:Int, alpha=0) : Void return untyped __call__('imagecolorset', image, index, red, green, blue, alpha);
	
	
	public static inline function imagecolorsforindex(image:Resource, index:Int) : NativeArray return untyped __call__('imagecolorsforindex', image, index);
	
	public static inline function imagecolorstotal(image:Resource) : Int return untyped __call__('imagecolorstotal', image);
	
	public static function imagecolortransparent(image:Resource, ?color:Int) : Int
	{
		if (color == null)
		{
			return untyped __call__('imagecolortransparent', image);
		}
		else
		{
			return untyped __call__('imagecolortransparent', image, color);
		}
	}
	
	public static inline function imageconvolution(image:Resource, matrix:NativeArray, div:Float, offset:Float) : Bool return untyped __call__('imageconvolution', image, matrix, div, offset);
	
	public static inline function imagecopy(dst_im:Resource, src_im:Resource, dst_x:Int, dst_y:Int, src_x:Int, src_y:Int, src_w:Int, src_h:Int) : Bool return untyped __call__('imagecopy', dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h);
	
	public static inline function imagecopymerge(dst_im:Resource, src_im:Resource, dst_x:Int, dst_y:Int, src_x:Int, src_y:Int, src_w:Int, src_h:Int, pct:Int) : Bool return untyped __call__('imagecopymerge', dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h, pct);
	
	public static inline function imagecopymergegray(dst_im:Resource, src_im:Resource, dst_x:Int, dst_y:Int, src_x:Int, src_y:Int, src_w:Int, src_h:Int, pct:Int) : Bool return untyped __call__('imagecopymergegray', dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h, pct);
	
	public static inline function imagecopyresampled(dst_image:Resource, src_image:Resource, dst_x:Int, dst_y:Int, src_x:Int, src_y:Int, dst_w:Int, dst_h:Int, src_w:Int, src_h:Int) : Bool return untyped __call__('imagecopyresampled', dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h);
	
	public static inline function imagecopyresized(dst_image:Resource, src_image:Resource, dst_x:Int, dst_y:Int, src_x:Int, src_y:Int, dst_w:Int, dst_h:Int, src_w:Int, src_h:Int) : Bool return untyped __call__('imagecopyresized', dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h);
	
	public static inline function imagecreate(width:Int, height:Int) : Resource return untyped __call__('imagecreate', width, height);
	
	public static inline function imagecreatefromgd2(filename:String) : Resource return untyped __call__('imagecreatefromgd2', filename);
	
	public static inline function imagecreatefromgd2part(filename:String, srcX:Int, srcY:Int, width:Int, height:Int) : Resource return untyped __call__('imagecreatefromgd2part', filename, srcX, srcY, width, height);
	
	public static inline function imagecreatefromgd(filename:String) : Resource return untyped __call__('imagecreatefromgd', filename);
	
	public static inline function imagecreatefromgif(filename:String) : Resource return untyped __call__('imagecreatefromgif', filename);
	
	public static inline function imagecreatefromjpeg(filename:String) : Resource return untyped __call__('imagecreatefromjpeg', filename);
	
	public static inline function imagecreatefrompng(filename:String) : Resource return untyped __call__('imagecreatefrompng', filename);
	
	public static inline function imagecreatefromstring(image:String) : Resource return untyped __call__('imagecreatefromstring', image);
	
	public static inline function imagecreatefromwbmp(filename:String) : Resource return untyped __call__('imagecreatefromwbmp', filename);
	
	public static inline function imagecreatefromwebp(filename:String) : Resource return untyped __call__('imagecreatefromwebp', filename);
	
	public static inline function imagecreatefromxbm(filename:String) : Resource return untyped __call__('imagecreatefromxbm', filename);
	
	public static inline function imagecreatefromxpm(filename:String) : Resource return untyped __call__('imagecreatefromxpm', filename);
	
	public static inline function imagecreatetruecolor(width:Int, height:Int) : Resource return untyped __call__('imagecreatetruecolor', width, height);
	
	public static inline function imagecrop(image:Resource, rect:NativeArray) : Resource return untyped __call__('imagecrop', image, rect);
	
	public static function imagecropauto(image:Resource, ?mode:Int=-1, ?threshold:Float=.5, ?color:Int=-1) : Resource
	{
		if (threshold == null)
		{
			return untyped __call__('imagecropauto', image, mode);
		}
		else
		{
			return untyped __call__('imagecropauto', image, mode, threshold, color);
		}
	}
	
	public static inline function imagedashedline(image:Resource, x1:Int, y1:Int, x2:Int, y2:Int, color:Int) : Bool return untyped __call__('imagedashedline', image, x1, y1, x2, y2, color);
	
	public static inline function imagedestroy(image:Resource) : Bool return untyped __call__('imagedestroy', image);
	
	public static inline function imageellipse(image:Resource, cx:Int, cy:Int, width:Int, height:Int, color:Int) : Bool return untyped __call__('imageellipse', image, cx, cy, width, height, color);
	
	public static inline function imagefill(image:Resource, x:Int, y:Int, color:Int) : Bool return untyped __call__('imagefill', image, x, y, color);
	
	public static inline function imagefilledarc(image:Resource, cx:Int, cy:Int, width:Int, height:Int, start:Int, end:Int, color:Int, style:Int) : Bool return untyped __call__('imagefilledarc', image, cx, cy, width, height, start, end, color, style);
	
	public static inline function imagefilledellipse(image:Resource, cx:Int, cy:Int, width:Int, height:Int, color:Int) : Bool return untyped __call__('imagefilledellipse', image, cx, cy, width, height, color);
	
	public static inline function imagefilledpolygon(image:Resource, points:NativeArray, num_points:Int, color:Int) : Bool return untyped __call__('imagefilledpolygon', image, points, num_points, color);
	
	public static inline function imagefilledrectangle(image:Resource, x1:Int, y1:Int, x2:Int, y2:Int, color:Int) : Bool return untyped __call__('imagefilledrectangle', image, x1, y1, x2, y2, color);
	
	public static inline function imagefilltoborder(image:Resource, x:Int, y:Int, border:Int, color:Int) : Bool return untyped __call__('imagefilltoborder', image, x, y, border, color);
	
	public static function imagefilter(image:Resource, filtertype:Int, ?arg1:Int, ?arg2:Int, ?arg3:Int, ?arg4:Int) : Bool
	{
		if (arg4 == null)
		{
			if (arg3 == null)
			{
				if (arg2 == null)
				{
					if (arg1 == null)
					{
						return untyped __call__('imagefilter', image, filtertype);
					}
					else
					{
						return untyped __call__('imagefilter', image, filtertype, arg1);
					}
				}
				else
				{
					return untyped __call__('imagefilter', image, filtertype, arg1, arg2);
				}
			}
			else
			{
				return untyped __call__('imagefilter', image, filtertype, arg1, arg2, arg3);
			}
		}
		else
		{
			return untyped __call__('imagefilter', image, filtertype, arg1, arg2, arg3, arg4);
		}
	}
	
	public static inline function imageflip(image:Resource, mode:Int) : Bool return untyped __call__('imageflip', image, mode);
	
	public static inline function imagefontheight(font:Int) : Int return untyped __call__('imagefontheight', font);
	
	public static inline function imagefontwidth(font:Int) : Int return untyped __call__('imagefontwidth', font);
	
	public static function imageftbbox(size:Float, angle:Float, fontfile:String, text:String, ?extrainfo:NativeArray) : NativeArray
	{
		if (extrainfo == null)
		{
			return untyped __call__('imageftbbox', size, angle, fontfile, text);
		}
		else
		{
			return untyped __call__('imageftbbox', size, angle, fontfile, text, extrainfo);
		}
	}
	
	public static function imagefttext(image:Resource, size:Float, angle:Float, x:Int, y:Int, color:Int, fontfile:String, text:String, ?extrainfo:NativeArray) : NativeArray
	{
		if (extrainfo == null)
		{
			return untyped __call__('imagefttext', image, size, angle, x, y, color, fontfile, text);
		}
		else
		{
			return untyped __call__('imagefttext', image, size, angle, x, y, color, fontfile, text, extrainfo);
		}
	}
	
	public static inline function imagegammacorrect(image:Resource, inputgamma:Float, outputgamma:Float) : Bool return untyped __call__('imagegammacorrect', image, inputgamma, outputgamma);
	
	public static function imagegd2(image:Resource, ?filename:String, ?chunk_size:Int, ?type:Int) : Bool
	{
		if (type == null)
		{
			if (chunk_size == null)
			{
				if (filename == null)
				{
					return untyped __call__('imagegd2', image);
				}
				else
				{
					return untyped __call__('imagegd2', image, filename);
				}
			}
			else
			{
				return untyped __call__('imagegd2', image, filename, chunk_size);
			}
		}
		else
		{
			return untyped __call__('imagegd2', image, filename, chunk_size, type);
		}
	}
	
	public static function imagegd(image:Resource, ?filename:String) : Bool
	{
		if (filename == null)
		{
			return untyped __call__('imagegd', image);
		}
		else
		{
			return untyped __call__('imagegd', image, filename);
		}
	}
	
	public static function imagegif(image:Resource, ?filename:String) : Bool
	{
		if (filename == null)
		{
			return untyped __call__('imagegif', image);
		}
		else
		{
			return untyped __call__('imagegif', image, filename);
		}
	}
	
	public static inline function imagegrabscreen() : Resource return untyped __call__('imagegrabscreen');
	
	public static inline function imagegrabwindow(window_handle:Int, client_area=0) : Resource return untyped __call__('imagegrabwindow', window_handle, client_area);
	
	public static inline function imageinterlace(image:Resource, interlace=0) : Int return untyped __call__('imageinterlace', image, interlace);
	
	public static inline function imageistruecolor(image:Resource) : Bool return untyped __call__('imageistruecolor', image);
	
	public static function imagejpeg(image:Resource, ?filename:String, ?quality:Int) : Bool
	{
		if (quality == null)
		{
			if (filename == null)
			{
				return untyped __call__('imagejpeg', image);
			}
			else
			{
				return untyped __call__('imagejpeg', image, filename);
			}
		}
		else
		{
			return untyped __call__('imagejpeg', image, filename, quality);
		}
	}
	
	public static inline function imagelayereffect(image:Resource, effect:Int) : Bool return untyped __call__('imagelayereffect', image, effect);
	
	public static inline function imageline(image:Resource, x1:Int, y1:Int, x2:Int, y2:Int, color:Int) : Bool return untyped __call__('imageline', image, x1, y1, x2, y2, color);
	
	public static inline function imageloadfont(file:String) : Int return untyped __call__('imageloadfont', file);
	
	public static inline function imagepalettecopy(destination:Resource, source:Resource) : Void return untyped __call__('imagepalettecopy', destination, source);
	
	public static inline function imagepalettetotruecolor(src:Resource) : Bool return untyped __call__('imagepalettetotruecolor', src);
	
	public static function imagepng(image:Resource, ?filename:String, ?quality:Int, ?filters:Int) : Bool
	{
		if (filters == null)
		{
			if (quality == null)
			{
				if (filename == null)
				{
					return untyped __call__('imagepng', image);
				}
				else
				{
					return untyped __call__('imagepng', image, filename);
				}
			}
			else
			{
				return untyped __call__('imagepng', image, filename, quality);
			}
		}
		else
		{
			return untyped __call__('imagepng', image, filename, quality, filters);
		}
	}
	
	public static inline function imagepolygon(image:Resource, points:NativeArray, num_points:Int, color:Int) : Bool return untyped __call__('imagepolygon', image, points, num_points, color);
	
	public static inline function imagepsbbox(text:String, font:Resource, size:Int) : NativeArray return untyped __call__('imagepsbbox', text, font, size);
	
	public static inline function imagepsencodefont(font_index:Resource, encodingfile:String) : Bool return untyped __call__('imagepsencodefont', font_index, encodingfile);
	
	public static inline function imagepsextendfont(font_index:Resource, extend:Float) : Bool return untyped __call__('imagepsextendfont', font_index, extend);
	
	public static inline function imagepsfreefont(font_index:Resource) : Bool return untyped __call__('imagepsfreefont', font_index);
	
	public static inline function imagepsloadfont(filename:String) : Resource return untyped __call__('imagepsloadfont', filename);
	
	public static inline function imagepsslantfont(font_index:Resource, slant:Float) : Bool return untyped __call__('imagepsslantfont', font_index, slant);
	
	public static inline function imagepstext(image:Resource, text:String, font_index:Resource, size:Int, foreground:Int, background:Int, x:Int, y:Int, space=0, tightness=0, ?angle:Float=0.0, ?antialias_steps:Int=4) : NativeArray return untyped __call__('imagepstext', image, text, font_index, size, foreground, background, x, y, space, tightness, angle, antialias_steps);
	
	public static inline function imagerectangle(image:Resource, x1:Int, y1:Int, x2:Int, y2:Int, color:Int) : Bool return untyped __call__('imagerectangle', image, x1, y1, x2, y2, color);
	
	public static inline function imagerotate(image:Resource, angle:Float, bgd_color:Int, ignore_transparent=0) : Resource return untyped __call__('imagerotate', image, angle, bgd_color, ignore_transparent);
	
	public static inline function imagesavealpha(image:Resource, saveflag:Bool) : Bool return untyped __call__('imagesavealpha', image, saveflag);
	
	public static function imagescale(image:Resource, new_width:Int, ?new_height:Int=-1, ?mode:Int) : Resource
	{
		if (mode == null)
		{
			return untyped __call__('imagescale', image, new_width, new_height);
		}
		else
		{
			return untyped __call__('imagescale', image, new_width, new_height, mode);
		}
	}
	
	public static inline function imagesetbrush(image:Resource, brush:Resource) : Bool return untyped __call__('imagesetbrush', image, brush);
	
	public static function imagesetinterpolation(image:Resource, ?method:Int) : Bool
	{
		if (method == null)
		{
			return untyped __call__('imagesetinterpolation', image);
		}
		else
		{
			return untyped __call__('imagesetinterpolation', image, method);
		}
	}
	
	public static inline function imagesetpixel(image:Resource, x:Int, y:Int, color:Int) : Bool return untyped __call__('imagesetpixel', image, x, y, color);
	
	public static inline function imagesetstyle(image:Resource, style:NativeArray) : Bool return untyped __call__('imagesetstyle', image, style);
	
	public static inline function imagesetthickness(image:Resource, thickness:Int) : Bool return untyped __call__('imagesetthickness', image, thickness);
	
	public static inline function imagesettile(image:Resource, tile:Resource) : Bool return untyped __call__('imagesettile', image, tile);
	
	public static inline function imagestring(image:Resource, font:Int, x:Int, y:Int, str:String, color:Int) : Bool return untyped __call__('imagestring', image, font, x, y, str, color);
	
	public static inline function imagestringup(image:Resource, font:Int, x:Int, y:Int, str:String, color:Int) : Bool return untyped __call__('imagestringup', image, font, x, y, str, color);
	
	public static inline function imagesx(image:Resource) : Int return untyped __call__('imagesx', image);
	
	public static inline function imagesy(image:Resource) : Int return untyped __call__('imagesy', image);
	
	public static inline function imagetruecolortopalette(image:Resource, dither:Bool, ncolors:Int) : Bool return untyped __call__('imagetruecolortopalette', image, dither, ncolors);
	
	public static inline function imagettfbbox(size:Float, angle:Float, fontfile:String, text:String) : NativeArray return untyped __call__('imagettfbbox', size, angle, fontfile, text);
	
	public static inline function imagettftext(image:Resource, size:Float, angle:Float, x:Int, y:Int, color:Int, fontfile:String, text:String) : NativeArray return untyped __call__('imagettftext', image, size, angle, x, y, color, fontfile, text);
	
	public static inline function imagetypes() : Int return untyped __call__('imagetypes');
	
	public static function imagewbmp(image:Resource, ?filename:String, ?foreground:Int) : Bool
	{
		if (foreground == null)
		{
			if (filename == null)
			{
				return untyped __call__('imagewbmp', image);
			}
			else
			{
				return untyped __call__('imagewbmp', image, filename);
			}
		}
		else
		{
			return untyped __call__('imagewbmp', image, filename, foreground);
		}
	}
	
	public static inline function imagewebp(image:Resource, filename:String) : Bool return untyped __call__('imagewebp', image, filename);
	
	public static function imagexbm(image:Resource, filename:String, ?foreground:Int) : Bool
	{
		if (foreground == null)
		{
			return untyped __call__('imagexbm', image, filename);
		}
		else
		{
			return untyped __call__('imagexbm', image, filename, foreground);
		}
	}
	
	public static inline function iptcembed(iptcdata:String, jpeg_file_name:String, spool=0) : Dynamic return untyped __call__('iptcembed', iptcdata, jpeg_file_name, spool);
	
	public static inline function iptcparse(iptcblock:String) : NativeArray return untyped __call__('iptcparse', iptcblock);
	
	public static inline function jpeg2wbmp(jpegname:String, wbmpname:String, dest_height:Int, dest_width:Int, threshold:Int) : Bool return untyped __call__('jpeg2wbmp', jpegname, wbmpname, dest_height, dest_width, threshold);
	
	public static inline function png2wbmp(pngname:String, wbmpname:String, dest_height:Int, dest_width:Int, threshold:Int) : Bool return untyped __call__('png2wbmp', pngname, wbmpname, dest_height, dest_width, threshold);
}
