package com.iconeo.events
{
	import flash.events.Event;

	public class GalerieEvent extends Event
	{
		public static const AFFICHAGE_MEDIA:String = "affichageMedia";
		
		private var _urlMedia:String;
		
		public function GalerieEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event{
			var clone:GalerieEvent = new GalerieEvent(type, bubbles, cancelable);
			return clone;
		}
		
		public function get urlMedia():String{
			return _urlMedia;
		}
		
		public function set urlMedia(urlMedia:String):void{
			_urlMedia = urlMedia;
		}
	}
}