package orichalcum.tool.image 
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	public class ImageRecorder 
	{
		
		static public var defaultOutputDirectory:File = new File(File.desktopDirectory.nativePath + '/orichalcum-toolbelt/image-recorder/images');
		static public var defaultActivationKey:uint = Keyboard.R;
		static public var defaultImageEncoding:ImageEncoding = ImageEncoding.PNG;
		private var _enterFrameEventDispatcher:IEventDispatcher = new Shape;
		private var _outputDirectory:File = defaultOutputDirectory;
		private var _activationKey:uint = defaultActivationKey;
		private var _imageEncoding:ImageEncoding = defaultImageEncoding;
		private var _imageCaptor:ImageCaptor = new ImageCaptor;
		private var _imageWriter:ImageWriter = new ImageWriter;
		private var _target:DisplayObject;
		private var _clip:Rectangle;
		private var _isKeyboardEnabled:Boolean;
		private var _isRecording:Boolean;
		private var _imageCount:int;
		
		
		public function ImageRecorder() 
		{
			this.isKeyboardEnabled = true;
		}
		
		public function get outputDirectory():File 
		{
			return _outputDirectory;
		}
		
		public function set outputDirectory(value:File):void 
		{
			if (value)
			{
				if (!value.isDirectory)
				{
					throw new ArgumentError('ImageRecorder.outputDirectory cannot be assiged a non-directory file type.');
				}
				_outputDirectory = value;
			}
			else
			{
				_outputDirectory = defaultOutputDirectory;
			}
			_outputDirectory.createDirectory();
		}
		
		public function get activationKey():uint 
		{
			return _activationKey;
		}
		
		public function set activationKey(value:uint):void 
		{
			_activationKey = value;
		}
		
		public function get isKeyboardEnabled():Boolean 
		{
			return _isKeyboardEnabled;
		}
		
		public function set isKeyboardEnabled(value:Boolean):void 
		{
			if (_isKeyboardEnabled == value) return;
			if (_isKeyboardEnabled = value)
			{
				NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
				NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			}
			else
			{
				NativeApplication.nativeApplication.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
				NativeApplication.nativeApplication.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			}
		}
		
		public function get isRecording():Boolean 
		{
			return _isRecording;
		}
		
		public function set isRecording(value:Boolean):void 
		{
			if (_isRecording == value) return;
			if (_isRecording = value)
			{
				_record();
				_enterFrameEventDispatcher.addEventListener(Event.ENTER_FRAME, _record, false, 0, true);
			}
			else
			{
				_enterFrameEventDispatcher.removeEventListener(Event.ENTER_FRAME, _record);
			}
		}
		
		public function get imageEncoding():ImageEncoding 
		{
			return _imageEncoding;
		}
		
		public function set imageEncoding(value:ImageEncoding):void 
		{
			_imageEncoding = value ? value : defaultImageEncoding;
		}
		
		public function get target():DisplayObject 
		{
			return _target;
		}
		
		public function set target(value:DisplayObject):void 
		{
			_target = value;
		}
		
		public function get clip():Rectangle 
		{
			return _clip;
		}
		
		public function set clip(value:Rectangle):void 
		{
			_clip = value;
		}
		
		public function record(target:DisplayObject = null):void
		{
			target && (this.target = target);
			isRecording = true;
		}
		
		public function pause():void
		{
			isRecording = false;
		}
		
		public function toggle():void
		{
			isRecording = !isRecording;
		}
		
		private function _record(event:Event = null):void 
		{
			_imageWriter.write(
				_imageCaptor.capture(target, clip)
				,imageEncoding.encoder
				,outputDirectory.nativePath + '/' + _fileNamer()
			);
		}
		
		private function _onKeyDown(event:KeyboardEvent):void 
		{
			if (event.keyCode == activationKey)
			{
				record();
			}
		}
		
		private function _onKeyUp(event:KeyboardEvent):void 
		{
			if (event.keyCode == activationKey)
			{
				pause();
			}
		}
		
		private function _fileNamer():String
		{
			return (_imageCount++).toString() + '.' + imageEncoding.fileExtension;
		}
		
	}

}
