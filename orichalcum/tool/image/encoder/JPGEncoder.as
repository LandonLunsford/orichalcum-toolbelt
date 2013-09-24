package orichalcum.tool.image.encoder 
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import com.adobe.images.JPGEncoder;
	
	public class JPGEncoder implements IImageEncoder
	{
		
		private var _delegate:com.adobe.images.JPGEncoder = new com.adobe.images.JPGEncoder;
		
		public function encode(image:BitmapData):ByteArray 
		{
			return _delegate.encode(image);
		}
		
	}

}
