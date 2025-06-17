<?php
if(isset($_GET['query'])) {
    $query = '%' . $_GET['query'] . '%';
    $stmt = getDB()->prepare("
        SELECT * FROM movies 
        WHERE title LIKE ? OR genres LIKE ? OR storyline LIKE ?
        ORDER BY title
    ");
    $stmt->execute([$query, $query, $query]);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!-- Display results similar to index.php -->