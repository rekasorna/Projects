<?php 
require_once 'config.php';

$movies = [];
try {
    $stmt = getDB()->query("SELECT * FROM movies ORDER BY created_at DESC LIMIT 12");
    $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    error_log($e->getMessage());
}
?>

<!-- In your HTML movie cards -->
<?php foreach($movies as $movie): ?>
<div class="movie-card">
    <a href="movie.php?id=<?= $movie['id'] ?>">
        <figure class="card-banner">
            <img src="<?= htmlspecialchars($movie['image_path']) ?>" 
                 alt="<?= htmlspecialchars($movie['title']) ?>">
            <?php if($movie['video_path']): ?>
            <video class="card-video" src="<?= htmlspecialchars($movie['video_path']) ?>" muted loop></video>
            <?php endif; ?>
        </figure>
    </a>
    <!-- Rest of card content -->
</div>
<?php endforeach; ?>