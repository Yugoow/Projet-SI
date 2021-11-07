<?php
$host = "mysql-server";
$user = "root";
$pass = "admin";
$db = "app1";
try {
	$conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	echo "Connected successfully";
} catch(PDOException $e) {
	echo "Connection failed: ".$e->getMessage();
}
?>
<html>
	<head>
		<title>ABSTERGO</title>
	</head>
	<body>
		<h1>Bienvenue sur le site d'Abstergo !</h1>
	</body>

</html>
