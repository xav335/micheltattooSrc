package com.iconeo.data
{
	public class AnimationData
	{
		private var _id:Number;
		private var _libelle:String;
		private var _fichierVignette:String;
		private var _fichierAnimation:String;
		private var _fichierApercu:String;
		
		public function get id():Number{
			return _id;
		}
		
		public function get libelle():String{
			return _libelle;
		}
		
		public function get fichierVignette():String{
			return _fichierVignette;
		}
		
		public function get fichierAnimation():String{
			return _fichierAnimation;
		}
		
		public function get fichierApercu():String{
			return _fichierApercu;
		}
		
		public function set id(id:Number):void{
			_id = id;
		}
		
		public function set libelle(libelle:String):void{
			_libelle = libelle;
		}
		
		public function set fichierVignette(urlVignette:String):void{
			_fichierVignette = urlVignette;
		}
		
		public function set fichierAnimation(urlAnimation:String):void{
			_fichierAnimation = urlAnimation;
		}
		
		public function set fichierApercu(fichierApercu:String):void{
			_fichierApercu = fichierApercu;
		}
	}
}