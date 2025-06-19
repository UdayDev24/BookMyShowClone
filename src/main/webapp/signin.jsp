<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In | BookMyShow Clone</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
:root {
    --primary-color: rgb(113, 2, 125);
    --primary-hover: rgb(210, 57, 30);
    --bg-color: #AABBC2;
    --form-bg: rgba(208, 222, 128, 0.7);
    --text-light: rgb(223, 213, 213);
}

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--bg-color);
    background-image: url(./assets/loginback);
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    background-color: var(--form-bg);
    border-radius: 20px;
    padding: 40px;
    width: 100%;
    max-width: 450px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    backdrop-filter: blur(5px);
}

.login-title {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: 700;
    position: relative;
}

.login-title:after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: var(--primary-color);
    margin: 10px auto 0;
}

.input-group {
    margin-bottom: 25px;
}

.input-group h3 {
    margin-bottom: 8px;
    font-size: 16px;
    color: #333;
}

.input-group input {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s;
}

.input-group input:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(113, 2, 125, 0.2);
}

.forgot-password {
    text-align: right;
    margin-top: 5px;
}

.forgot-password a {
    color: #333 !important;
    font-size: 14px;
    text-decoration: underline;
}

.primary-button {
    background-color: var(--primary-color);
    color: var(--text-light) !important;
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    cursor: pointer;
    transition: all 0.3s;
    margin-top: 10px;
}

.primary-button:hover {
    background-color: var(--primary-hover);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.signup-link {
    text-align: center;
    margin-top: 25px;
    color: #333;
}

.signup-link a {
    color: var(--primary-color) !important;
    font-weight: 600;
    transition: all 0.3s;
}

.signup-link a:hover {
    color: var(--primary-hover) !important;
}

@media (max-width: 576px) {
    .login-container {
        padding: 30px 20px;
        margin: 20px;
    }
}
</style>
</head>
<body>
    <form method="post" action="register" class="login-container">
        <h1 class="login-title"><i class="fas fa-sign-in-alt"></i> Sign In</h1>
        
        <div class="input-group">
            <h3>Username</h3>
            <input type="text" placeholder="Enter your username" name="username" required>
        </div>
        
        <div class="input-group">
            <h3>Password</h3>
            <input type="password" placeholder="Enter your password" name="pw" required>
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>

        <button type="submit" class="primary-button" name="login">
            <i class="fas fa-sign-in-alt"></i> Sign In
        </button>
        
        <div class="signup-link">
            <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
        </div>
    </form>
</body>
</html>