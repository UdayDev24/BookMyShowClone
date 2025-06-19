<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMyShow - Header</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
:root {
    --primary-color: #f84464;
    --primary-hover: #e13353;
    --text-light: #ffffff;
    --bg-dark: #1a1a1a;
    --bg-light: #2d2d2d;
}

.navbar-container {
    background-color: var(--bg-dark);
    color: var(--text-light);
    padding: 0.8rem 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.navbar-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.nav-left {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.nav-logo img {
    height: 36px;
}

.search-bar {
    position: relative;
    width: 400px;
}

.search-bar input {
    width: 100%;
    padding: 0.6rem 1rem;
    padding-right: 2.5rem;
    border-radius: 4px;
    border: none;
    background-color: var(--bg-light);
    color: var(--text-light);
}

.search-bar i {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.location-select {
    background-color: transparent;
    color: var(--text-light);
    border: 1px solid #555;
    border-radius: 4px;
    padding: 0.4rem 0.8rem;
    cursor: pointer;
}

.nav-option {
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
    transition: color 0.2s;
    padding: 0.5rem;
}

.nav-option:hover {
    color: var(--primary-color);
}

.primary-button {
    background-color: var(--primary-color);
    color: var(--text-light) !important;
    border: none;
    border-radius: 4px;
    padding: 0.5rem 1.2rem;
    font-weight: 500;
    transition: all 0.2s;
    text-decoration: none;
}

.primary-button:hover {
    background-color: var(--primary-hover);
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.user-info {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: var(--text-light);
}

.user-icon {
    color: var(--primary-color);
}

.nav-menu {
    background-color: var(--bg-light);
    padding: 0.8rem 0;
}

.menu-items {
    display: flex;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.menu-link {
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
    font-size: 0.9rem;
    transition: color 0.2s;
}

.menu-link:hover {
    color: var(--primary-color);
}

@media (max-width: 992px) {
    .search-bar {
        width: 300px;
    }
}

@media (max-width: 768px) {
    .navbar-content {
        flex-wrap: wrap;
        gap: 1rem;
    }
    
    .search-bar {
        order: 3;
        width: 100%;
    }
    
    .nav-right {
        margin-left: auto;
    }
}
</style>
</head>
<body>
    <nav class="navbar-container">
        <div class="navbar-content">
            <div class="nav-left">
                <div class="nav-logo">
                    <img src="./assets/asset99.png" alt="BookMyShow Logo">
                </div>
                <div class="search-bar">
                    <input type="search" placeholder="Search for Movies, Events, Plays, Sports and Activities">
                    <i class="fas fa-search"></i>
                </div>
            </div>
            
            <div class="nav-right">
                <select class="location-select">
                    <option value="">Bengaluru</option>
                    <option value="">Mumbai</option>
                    <option value="">Pune</option>
                    <option value="">Delhi-NCR</option>
                    <option value="">Surat</option>
                </select>
                
                <% if (session.getAttribute("uname") != null) { 
                    if (session.getAttribute("id").equals("1")) { %>
                        <a href="DeleteUser.jsp" class="nav-option">Delete</a>
                        <a href="search.jsp" class="nav-option">Search</a>
                    <% } %>
                    <a href="edit.jsp" class="nav-option">Edit</a>
                    <a href="register?logout=yes" class="primary-button">Logout</a>
                    <div class="user-info">
                        <i class="fas fa-circle-user user-icon"></i>
                        <%= session.getAttribute("uname") %>
                    </div>
                <% } else { %>
                    <a href="signin.jsp" class="primary-button">Sign In</a>
                    <a href="#" class="nav-option"><i class="fas fa-bars"></i></a>
                <% } %>
            </div>
        </div>
        
        <div class="nav-menu">
            <div class="menu-items">
                <a href="#" class="menu-link">Movies</a>
                <a href="#" class="menu-link">Stream</a>
                <a href="#" class="menu-link">Events</a>
                <a href="#" class="menu-link">Plays</a>
                <a href="#" class="menu-link">Sports</a>
                <a href="#" class="menu-link">Activities</a>
                <a href="#" class="menu-link">ListYourShow</a>
                <a href="#" class="menu-link">Corporates</a>
                <a href="#" class="menu-link">Offers</a>
                <a href="#" class="menu-link">Gift Cards</a>
            </div>
        </div>
    </nav>
</body>
</html>