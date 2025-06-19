<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up | BookMyShow Clone</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
:root {
    --primary-color: rgb(113, 2, 125);
    --primary-hover: rgb(210, 57, 30);
    --bg-color: #C0d6df;
    --form-bg: rgba(236, 238, 188, 0.85);
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

.signup-container {
    background-color: var(--form-bg);
    border-radius: 20px;
    padding: 40px;
    width: 100%;
    max-width: 800px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    backdrop-filter: blur(5px);
}

.signup-title {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: 700;
    position: relative;
}

.signup-title:after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: var(--primary-color);
    margin: 10px auto 0;
}

.form-row {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -15px;
}

.form-col {
    flex: 0 0 50%;
    padding: 0 15px;
    margin-bottom: 20px;
}

.input-group {
    margin-bottom: 20px;
}

.input-group h4 {
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

.btn-container {
    text-align: center;
    margin-top: 20px;
}

.primary-button {
    background-color: var(--primary-color);
    color: var(--text-light) !important;
    border: none;
    border-radius: 8px;
    padding: 12px 30px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    min-width: 200px;
}

.primary-button:hover {
    background-color: var(--primary-hover);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.login-link {
    text-align: center;
    margin-top: 25px;
    color: #333;
}

.login-link a {
    color: var(--primary-color) !important;
    font-weight: 600;
    transition: all 0.3s;
}

.login-link a:hover {
    color: var(--primary-hover) !important;
}

@media (max-width: 768px) {
    .form-col {
        flex: 0 0 100%;
    }
    
    .signup-container {
        padding: 30px 20px;
        margin: 20px;
    }
}
</style>
</head>
<body>
    <form action="register" method="post" class="signup-container">
        <h1 class="signup-title"><i class="fas fa-user-plus"></i> Create Account</h1>
        
        <div class="form-row">
            <div class="form-col">
                <div class="input-group">
                    <h4>Full Name</h4>
                    <input type="text" placeholder="Enter your full name" name="fname" required>
                </div>
            </div>
            <div class="form-col">
                <div class="input-group">
                    <h4>Username</h4>
                    <input type="text" placeholder="Enter your username" name="uname" required>
                </div>
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-col">
                <div class="input-group">
                    <h4>Email</h4>
                    <input type="email" placeholder="Enter your email" name="email" required>
                </div>
            </div>
            <div class="form-col">
                <div class="input-group">
                    <h4>Phone Number</h4>
                    <input type="tel" placeholder="Enter your phone number" name="phone" required>
                </div>
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-col">
                <div class="input-group">
                    <h4>Password</h4>
                    <input type="password" placeholder="Create password" name="pw" id="pw" required>
                </div>
            </div>
            <div class="form-col">
                <div class="input-group">
                    <h4>Confirm Password</h4>
                    <input type="password" placeholder="Confirm password" name="cp" required>
                </div>
            </div>
        </div>
        
        <div class="btn-container">
            <button type="submit" class="primary-button" name="register">
                <i class="fas fa-user-edit"></i> Sign Up
            </button>
        </div>
        
        <div class="login-link">
            <p>Already have an account? <a href="signin.jsp">Sign In</a></p>
        </div>
    </form>
</body>
</html>