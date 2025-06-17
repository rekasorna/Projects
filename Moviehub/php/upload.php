<?php
function uploadFile($file, $targetDir) {
    $fileName = uniqid() . '-' . basename($file['name']);
    $targetPath = $targetDir . $fileName;
    
    // Validate file type
    $allowedTypes = ['image/jpeg', 'image/png', 'video/mp4'];
    if(!in_array($file['type'], $allowedTypes)) {
        throw new Exception("Invalid file type");
    }
    
    // Move uploaded file
    if(move_uploaded_file($file['tmp_name'], $targetPath)) {
        return $fileName;
    }
    throw new Exception("File upload failed");
}

// Example usage in add-movie.php:
if($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $imagePath = 'assets/images/' . uploadFile($_FILES['poster'], 'assets/images/');
        $videoPath = 'assets/videos/' . uploadFile($_FILES['trailer'], 'assets/videos/');
        
        $stmt = getDB()->prepare("INSERT INTO movies (...) VALUES (...)");
        $stmt->execute([...]);
        
        header("Location: movie.php?id=" . getDB()->lastInsertId());
    } catch(Exception $e) {
        $error = $e->getMessage();
    }
}
?>