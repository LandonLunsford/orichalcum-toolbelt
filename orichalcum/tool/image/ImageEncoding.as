package orichalcum.tool.image 
{
	import orichalcum.tool.image.encoder.IImageEncoder;
	import orichalcum.tool.image.encoder.JPGEncoder;
	import orichalcum.tool.image.encoder.PNGEncoder;
	
	public class ImageEncoding 
	{
		
		static public const JPG:ImageEncoding = new ImageEncoding('JPG', 'jpg', new JPGEncoder);
		static public const PNG:ImageEncoding = new ImageEncoding('PNG', 'png', new PNGEncoder);
		
		private var _name:String;
		private var _fileExtension:String;
		private var _encoder:IImageEncoder;
		
		public function ImageEncoding(name:String, fileExtension:String, encoder:IImageEncoder) 
		{
			_name = name;
			_fileExtension = fileExtension;
			_encoder = encoder;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get fileExtension():String 
		{
			return _fileExtension;
		}
		
		public function get encoder():IImageEncoder 
		{
			return _encoder;
		}
		
	}

}
