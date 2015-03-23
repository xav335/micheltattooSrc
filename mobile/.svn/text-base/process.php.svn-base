<?php

//Retrieve form data. 
//GET - user submitted data using AJAX
//POST - in case user does not support javascript, we'll use POST instead
$prenom = ($_GET['prenom']) ? $_GET['prenom'] : $_POST['prenom'];
$nom = ($_GET['nom']) ? $_GET['nom'] : $_POST['nom'];
$email = ($_GET['email']) ?$_GET['email'] : $_POST['email'];
$telephone = ($_GET['telephone']) ?$_GET['telephone'] : $_POST['telephone'];
$msg = ($_GET['msg']) ?$_GET['msg'] : $_POST['msg'];

//flag to indicate which method it uses. If POST set it to 1
if ($_POST) $post=1;

//Simple server side validation for POST data, of course, you should validate the email
if (!$prenom) $errors[count($errors)] = 'Veuillez saisir votre prénom.';
if (!$nom) $errors[count($errors)] = 'Veuillez saisir votre nom.';
if (!$email) $errors[count($errors)] = 'Veuillez saisir votre email.'; 
if (!$telephone) $errors[count($errors)] = 'Veuillez saisir votre téléphone.'; 
if (!$msg) $errors[count($errors)] = 'Veuillez saisir votre message.'; 

//if the errors array is empty, send the mail
if (!$errors) {

	//recipient
	$to = 'Michel Tattoo <contact@micheltattoo.com>';
	//sender
	$from = $nom . ' <' . $email . '>';
	
	//subject and the html message
	$subject = 'Message depuis le site mobile';	
	$message = '
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head></head>
	<body>
	<table>
		<tr><td>Nom</td><td>' . $nom . '</td></tr>
		<tr><td>Prénom</td><td>' . $prenom . '</td></tr>
		<tr><td>Email</td><td>' . $email . '</td></tr>
		<tr><td>Téléphone</td><td>' . $telephone . '</td></tr>
		<tr><td>Message</td><td>' . nl2br($msg) . '</td></tr>
	</table>
	</body>
	</html>';

	//send the mail
	$result = sendmail($to, $subject, $message, $from);
	
	//if POST was used, display the message straight away
	if ($_POST) {
		if ($result) echo 'Merci, nous avons bien reçu votre message.';
		else echo 'Une erreur inattendue s\'est produite. Veuillez réessayer plus tard.';
		
	//else if GET was used, return the boolean value so that 
	//ajax script can react accordingly
	//1 means success, 0 means failed
	} else {
		echo $result;	
	}

//if the errors array has values
} else {
	//display the errors message
	for ($i=0; $i<count($errors); $i++) echo $errors[$i] . '<br/>';
	echo '<a href="index.php">Retour</a>';
	exit;
}


//Simple mail function with HTML header
function sendmail($to, $subject, $message, $from) {
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type:text/html;charset=utf-8" . "\r\n";
	$headers .= 'From: ' . $from . "\r\n";
	
	$result = mail($to,$subject,$message,$headers);
	
	if ($result) return 1;
	else return 0;
}

?>