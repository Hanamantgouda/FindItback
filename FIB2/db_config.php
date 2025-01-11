<?php
$servername = "localhost";
$username = "root"; // Change this if you have a different DB username
$password = ""; // Change this if you have a DB password
$dbname = "finditback";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
