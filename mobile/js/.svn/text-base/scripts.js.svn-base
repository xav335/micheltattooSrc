/* Détection version mobile */
if (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/BlackBerry/i) || 
		navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/Palm/i) )
	{} else {
		window.location = 'http://www.micheltattoo.com';
	}

/* Préchargement */
var jQT = new $.jQTouch({
	icon: 'mt.png',
	icon4: 'mt4.png',
	addGlossToIcon: true,
	startupScreen: 'mt_startup.png',
	statusBar: 'black-translucent',
	preloadImages: [
		'fonts/28daysla.eot',
		'fonts/28daysla.svg',
		'fonts/28daysla.ttf',
		'fonts/28daysla.woff',
		'fonts/itcavantgardestd-bkcn.eot',
		'fonts/itcavantgardestd-bkcn.svg',
		'fonts/itcavantgardestd-bkcn.ttf',
		'fonts/itcavantgardestd-bkcn.woff',
		'img/autoclave.jpg',
		'img/logo.svg',
		'img/michel.jpg'
	]
});

/* Fonctions */
$(document).ready(function(){

	// On masque le menu au bout de 1s
	$('.toolbar').delay(1000).animate({top: '-480px' }, 500);

	// Affichage du bouton HAUT au scroll
	$('.haut').hide();
	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('.haut').fadeIn();
		} else {
			$('.haut').fadeOut();
		}
	});
	$('.haut').tap(function(){
		$('html, body').animate({ scrollTop: 0 }, 600);
			return false;
	});
	$('.scroll').tap(function(event){		
		event.preventDefault();
		$('html,body').animate({scrollTop:$('[name="'+this.hash.substring(1)+'"]').offset().top}, 600);
	});

	// Menu déroulant
	$('.top a').click(function() {
		$('.toolbar').animate({top: '84px' }, 500);
		$('#videohtml5').hide();
		time = setTimeout(function() {
				$('.toolbar').animate({top: '-480px' }, 500);
				$('#videohtml5').show();
			},5000);
	});

	$('.toolbar a').click(function() {
		clearTimeout(time);
		$('.toolbar').animate({top: '-480px' }, 500);
		$('#videohtml5').show();
	});

	// Formulaire de contact
	$('#submit').click(function () {
		// Récupération des données du formulaire
		var prenom = $('input[name=prenom]');
		var nom = $('input[name=nom]');
		var email = $('input[name=email]');
		var telephone = $('input[name=telephone]');
		var msg = $('textarea[name=msg]');
		// Vérification des données, si un champ est vide, il s'affichera en surbrillance
		if (prenom.val()=='') {
			prenom.addClass('hightlight');
			return false;
		} else prenom.removeClass('hightlight');	
		if (nom.val()=='') {
			nom.addClass('hightlight');
			return false;
		} else nom.removeClass('hightlight');	
		if (email.val()=='') {
			email.addClass('hightlight');
			return false;
		} else email.removeClass('hightlight');
		if (msg.val()=='') {
			msg.addClass('hightlight');
			return false;
		} else msg.removeClass('hightlight');
		// Préparation des données reçues
		var data = 'prenom=' + prenom.val() + '&nom=' + nom.val() + '&email=' + email.val() + '&telephone=' + 
		telephone.val() + '&msg='  + encodeURIComponent(msg.val());
		// Début de l'ajax
		$.ajax({
			// Fichier de traitement du formulaire
			url: "process.php",
			// La méthode GET est utilisée
			type: "GET",
			// Envoi des données			
			data: data,
			// Ne pas mettre en cache la page
			cache: false,
			// Succès
			success: function (html) {
				// Si process.php renvoie 1/true (l'envoi du mail est un succès)
				if (html==1) {
					// Masquer le formulaire
					$('#contactform').fadeOut('slow');
					// Afficher le message d'envoi effectué
					$('.done').fadeIn('slow');
				// Si process.php renvoie 0/false (le mail n'est pas parti)
				} else alert('Une erreur inattendue s\'est produite. Veuillez réessayer plus tard.');				
			}		
		});
		// Annuler les comportements par défaut du bouton Submit
		return false;
	});

});

/* Géolocalisation */
var depart;
function stopWatch(){
	navigator.geolocation.clearWatch(watchId);
}
function initialisation() {
	if (navigator.geolocation)
		navigator.geolocation.watchPosition(function(position) {
			{frequency:10000}
			var depart = position.coords.latitude + ", " + position.coords.longitude;
			$(".iti").attr("href", "http://maps.google.com/maps?saddr="+depart+"&daddr=11%20Rue%20de%20Guienne,%20Bordeaux");
		});
	else
	alert("Votre navigateur ne prend pas en compte la géolocalisation HTML5");
}
google.maps.event.addDomListener(window, 'load',initialisation);
