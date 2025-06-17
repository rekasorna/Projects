<?php
require_once 'config.php';

$movie = null;
if(isset($_GET['id'])) {
    try {
        $stmt = getDB()->prepare("SELECT * FROM movies WHERE id = ?");
        $stmt->execute([$_GET['id']]);
        $movie = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        error_log($e->getMessage());
    }
}

if(!$movie) {
    header("Location: index.php");
    exit;
}
?>

<!-- In your movie detail section -->
<section class="movie-detail">
    <figure class="movie-detail-banner">
        <img src="<?= htmlspecialchars($movie['image_path']) ?>" 
             alt="<?= htmlspecialchars($movie['title']) ?>">
    </figure>
    <div class="movie-detail-content">
        <h1><?= htmlspecialchars($movie['title']) ?></h1>
        <!-- Rest of details -->
    </div>
</section>