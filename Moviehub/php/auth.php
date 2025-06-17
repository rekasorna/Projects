<?php
require_once 'config.php';

session_start();

function login($username, $password) {
    $db = getDB();
    $stmt = $db->prepare("SELECT id, password_hash FROM users WHERE username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if($user && password_verify($password, $user['password_hash'])) {
        $_SESSION['user_id'] = $user['id'];
        return true;
    }
    return false;
}

function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

function logout() {
    session_destroy();
}
?>