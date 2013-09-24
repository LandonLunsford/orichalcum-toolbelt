package orichalcum.tool.image 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	public class ImageCaptor 
	{
		/**
		 * Note that 0x0 bitmaps cannot be recorded
		 * @param	target
		 * @param	clip
		 * @return
		 */
		public function capture(target:DisplayObject, clip:Rectangle = null):BitmapData
		{
			clip = _clipFilter(clip, target);
			const bitmapData:BitmapData = new BitmapData(clip.width, clip.height, true, 0);
			bitmapData.draw(target, null, null, null, clip, false);
			return bitmapData;
		}
		
		private function _clipFilter(clip:Rectangle, target:DisplayObject):Rectangle
		{
			if (clip) return clip;
			const targetAsStage:Stage = target as Stage;
			return targetAsStage
				? new Rectangle(0, 0, targetAsStage.stageWidth, targetAsStage.stageHeight)
				: target.getBounds(target);
		}
		
	}

}
