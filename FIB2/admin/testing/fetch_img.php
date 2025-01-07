<?php
// Specify the directory
$directory = "../uploads/belongings_uploads/";

// Check if the directory exists
if (is_dir($directory)) {
    // Get all files in the directory, excluding '.' and '..'
    $files = array_diff(scandir($directory), array('..', '.'));

    // Loop through each file and display it
    foreach ($files as $file) {
        $filePath = $directory . $file;

        // Display only images (filter by file extension)
        $fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif']; // Add other extensions if needed

        if (in_array(strtolower($fileExtension), $allowedExtensions)) {
            echo "<img src='$filePath' alt='$file' style='width:200px; margin:10px;'><br>";
        }
    }
} else {
    echo "The uploads folder does not exist.";
}
?>
