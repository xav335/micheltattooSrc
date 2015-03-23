package com.iconeo.remote
{
	import com.iconeo.data.AnimationData;
	
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.Responder;
	import flash.net.registerClassAlias;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class RemoteService
	{
		private static const URL_PARAMETRES:String = "http://iconeo.fr/tc1Site/toutatisBookParameters.do";
		private static const NOM_URL_PROPERTIES:String = "urlProperties";
		private static const NOM_URL_SERVICE:String = "urlService";
		private static const NOM_SERVICE_CONTROLEUR:String = "serviceControleur";
		private static const NOM_URL_ROOT:String = "urlRoot";
		private static const NOM_URL_UPLOAD:String = "urlUpload";
		private static const NOM_URL_FICHIERS:String = "urlFichiers";
		private static const NOM_URL_SERVICE_UPLOAD:String = "urlServiceUpload";
		private static const NOM_SERVICE_CONTROLEUR_UPLOAD:String = "serviceControleurUpload";
		private static const NOM_SERVICE_CONTROLEUR_ANIMATHEQUE:String = "serviceControleurAnimatheque";

		private static const LISTER_ANIMATIONS_BY_IDCAT:String=".listerCategorieSite";

		public static var initDone:Boolean = false;

		private static var _urlProperties:String;
		private static var _urlService:String;
		private static var _serviceControleur:String;
		private static var _urlRoot:String;
		private static var _urlUpload:String;
		private static var _urlFichiers:String;
		private static var _urlServiceUpload:String;
		private static var _serviceControleurUpload:String;
		private static var _serviceControleurAnimatheque:String;


		public static function init():void{
				var h:HTTPService = new HTTPService();
				h.url = URL_PARAMETRES;
				h.method="post";
				h.useProxy=false;
				
				h.addEventListener(ResultEvent.RESULT, handleResult);
				h.addEventListener(FaultEvent.FAULT, handleFault);
				h.send();
		}
			
		
		public static function recupererListeCategorie(idCategorie:int, handleListeCategorie:Function):void{
			registerClassAlias("TemplateVO",AnimationData);
			registerClassAlias("VideoVO",AnimationData);
			registerClassAlias("ImageVO",AnimationData); 

			var connexion:NetConnection = new NetConnection();
			connexion.objectEncoding = ObjectEncoding.AMF0;
			connexion.connect(_urlService);
			var responder:Responder = new Responder(handleListeCategorie, handleFault);
			connexion.call(_serviceControleurAnimatheque + LISTER_ANIMATIONS_BY_IDCAT, responder, idCategorie);
		}
		
		private static function handleResult(e:ResultEvent):void{
			trace("-----DEBUT RECEPTION-----");
			
			var parametres:ArrayCollection = e.result.parameters.preloader.init.properties;
    		for(var i:int = 0 ; i < parametres.length ; i++){
    			trace("[" + parametres[i].name + "=" + parametres[i].value + "]")
        		
        		switch(parametres[i].name) {
        			case(NOM_SERVICE_CONTROLEUR):
        				_serviceControleur = parametres[i].value;
        			break;
        			case(NOM_SERVICE_CONTROLEUR_ANIMATHEQUE):
        				 _serviceControleurAnimatheque = parametres[i].value;
        			break;
        			case(NOM_SERVICE_CONTROLEUR_UPLOAD):
        				 _serviceControleurUpload = parametres[i].value;
        			break;
        			case(NOM_URL_FICHIERS):
        				 _urlFichiers = parametres[i].value;
        			break;
        			case(NOM_URL_PROPERTIES):
        				 _urlProperties = parametres[i].value;
        			break;
        			case(NOM_URL_ROOT):
        				 _urlRoot = parametres[i].value;
        			break;
        			case(NOM_URL_SERVICE):
        				 _urlService = parametres[i].value;
        			break;
        			case(NOM_URL_SERVICE_UPLOAD):
        				 _urlServiceUpload = parametres[i].value;
        			break;
        			case(NOM_URL_UPLOAD):
        				 _urlUpload = parametres[i].value;
        			break;
        		}
    		}
			trace("-----FIN RECEPTION-----");
			initDone = true;
		}
		
		private static function handleFault(e:*):void{
			trace("Erreur de communication distante");
		}

	}
}