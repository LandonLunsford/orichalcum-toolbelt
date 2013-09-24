package orichalcum.tool.image.encoder 
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import com.adobe.images.JPGEncoder;
	
	public class JPGEncoder implements IImageEncoder
	{
		
		static private const FILE_EXTENSION:String = '.jpg';
		
		public function encode(image:BitmapData):ByteArray 
		{
			return com.adobe.images.JPGEncoder.encode(image);
		}
		
		public function get fileExtension():String 
		{
			return FILE_EXTENSION;
		}
		
	}

}
