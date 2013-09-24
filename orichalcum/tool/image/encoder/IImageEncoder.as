package orichalcum.tool.image.encoder 
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	public interface IImageEncoder 
	{
		function encode(image:BitmapData):ByteArray;
	}

}
