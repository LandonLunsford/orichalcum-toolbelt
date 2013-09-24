package orichalcum.tool.image.encoder 
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import com.adobe.images.PNGEncoder;
	
	public class PNGEncoder implements IImageEncoder
	{
		
		static private const FILE_EXTENSION:String = '.png';
		
		public function encode(image:BitmapData):ByteArray 
		{
			return com.adobe.images.PNGEncoder.encode(image);
		}
		
		public function get fileExtension():String 
		{
			return FILE_EXTENSION;
		}
		
	}

}
