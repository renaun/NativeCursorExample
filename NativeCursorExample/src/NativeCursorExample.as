package
{
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.text.TextField;
import flash.ui.Mouse;
import flash.ui.MouseCursor;
import flash.ui.MouseCursorData;

public class NativeCursorExample extends Sprite
{
	public function NativeCursorExample()
	{
		init();
	}
	
	[Embed(source="/assets/background.jpg")]
	private var BackgroundScene:Class;
	
	[Embed(source="/assets/TreeCursorBlink1.png")]
	private var TreeBitmap1:Class;
	
	[Embed(source="/assets/TreeCursorBlink2.png")]
	private var TreeBitmap2:Class;
	
	[Embed(source="/assets/TreeCursorBlink3.png")]
	private var TreeBitmap3:Class;
	
	[Embed(source="/assets/TreeCursorBlink4.png")]
	private var TreeBitmap4:Class;
	
	[Embed(source="/assets/TreeCursorBlink5.png")]
	private var TreeBitmap5:Class;
	
	[Embed(source="/assets/TreeCursorBlink6.png")]
	private var TreeBitmap6:Class;
	
	[Embed(source="/assets/TreeCursorBlink7.png")]
	private var TreeBitmap7:Class;
	
	[Embed(source="/assets/TreeCursorBlink8.png")]
	private var TreeBitmap8:Class;
	
	[Embed(source="/assets/TreeCursorBlink9.png")]
	private var TreeBitmap9:Class;
	
	private var mouseHit:Shape;
	
	private function init():void
	{
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		var cursorData:MouseCursorData = new MouseCursorData();
		cursorData.hotSpot = new Point(16,0);
		var bitmapDatas:Vector.<BitmapData> = new Vector.<BitmapData>(9, true);
		
		
		//var tree:Bitmap = new TreeBitmap() as Bitmap;
		var tree1:Bitmap = new TreeBitmap1() as Bitmap;
		var tree2:Bitmap = new TreeBitmap2() as Bitmap;
		var tree3:Bitmap = new TreeBitmap3() as Bitmap;
		var tree4:Bitmap = new TreeBitmap4() as Bitmap;
		var tree5:Bitmap = new TreeBitmap5() as Bitmap;
		var tree6:Bitmap = new TreeBitmap6() as Bitmap;
		var tree7:Bitmap = new TreeBitmap7() as Bitmap;
		var tree8:Bitmap = new TreeBitmap8() as Bitmap;
		var tree9:Bitmap = new TreeBitmap9() as Bitmap;
		
		var scene:Bitmap = new BackgroundScene() as Bitmap;
		scene.width = 500;
		addChild(scene);
		
		var i:int = 0
		bitmapDatas[i++] = tree1.bitmapData;
		bitmapDatas[i++] = tree2.bitmapData;
		bitmapDatas[i++] = tree3.bitmapData;
		bitmapDatas[i++] = tree4.bitmapData;
		bitmapDatas[i++] = tree5.bitmapData;
		bitmapDatas[i++] = tree6.bitmapData;
		bitmapDatas[i++] = tree7.bitmapData;
		bitmapDatas[i++] = tree8.bitmapData;
		bitmapDatas[i++] = tree9.bitmapData;
		
		cursorData.data = bitmapDatas;
		
		Mouse.registerCursor("treeCursor", cursorData);
		cursorData.frameRate = 1;  // TODO: doesn't seem to be doing anything for me
		Mouse.cursor = "treeCursor";
		
		mouseHit = new Shape;
		mouseHit.graphics.beginFill(0xFFFFFF, 0.5);
		mouseHit.graphics.lineStyle(2, 0x339922, 0.8);
		mouseHit.graphics.drawRect(-10,-10,20,20);
		mouseHit.x = -40;
		mouseHit.y = -40;
		addChild(mouseHit);
		
		stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
	}
	
	private function mouseDownHandler(event:MouseEvent):void
	{
		mouseHit.x = event.stageX;
		mouseHit.y = event.stageY;
	}
}
}