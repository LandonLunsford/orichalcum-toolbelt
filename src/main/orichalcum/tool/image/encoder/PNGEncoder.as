package orichalcum.tool.image.encoder 
{
	import com.adobe.images.PNGEncoder;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	public class PNGEncoder implements IImageEncoder
	{
		
		public function encode(image:BitmapData):ByteArray 
		{
			return com.adobe.images.PNGEncoder.encode(image);
		}
		
	}

}
