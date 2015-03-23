package com.iconeo.data
{
	
	public class CategorieData
	{
		private var _id:Number;
		private var _libelle:String;
		
		private var _survole:Boolean = false;

		private var _listeEnfant:Array;		
		
		public function CategorieData()
		{
			_listeEnfant = [];
		}

		public function get id():Number{
			return _id;
		}
		
		public function get libelle():String{
			return _libelle;
		}
		
		public function get survole():Boolean{
			return _survole;
		}
		
		public function get listeEnfant():Array{
			return _listeEnfant;
		}
		
		public function set id(id:Number):void{
			_id = id;
		}
		
		public function set libelle(libelle:String):void{
			_libelle = libelle;
		}
		
		public function set survole(survole:Boolean):void{
			_survole = survole;
		}
		
		public function set listeEnfant(listeEnfant:Array):void{
			_listeEnfant = listeEnfant;
		}
	}
}