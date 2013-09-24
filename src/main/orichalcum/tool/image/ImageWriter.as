package orichalcum.tool.image 
{
	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import orichalcum.tool.image.encoder.IImageEncoder;
	
	public class ImageWriter 
	{
		
		private var _fileStream:FileStream = new FileStream;
		
		public function write(image:BitmapData, encoder:IImageEncoder, path:String = null):void
		{
			_fileStream.open(new File(path), FileMode.WRITE);
			_fileStream.writeBytes(encoder.encode(image));
			_fileStream.close();
		}
		
	}

}
