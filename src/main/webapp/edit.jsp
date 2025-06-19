<%@page import="java.util.*"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | BookMyShow Clone</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
:root {
    --primary-color: #007bff;
    --primary-hover: #0069d9;
    --danger-color: #dc3545;
    --danger-hover: #c82333;
    --bg-color: #666666;
    --form-bg: #ffffff;
}

body {
    background-color: var(--bg-color);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.profile-container {
    max-width: 800px;
    margin: 2rem auto;
}

.profile-card {
    background-color: var(--form-bg);
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.15);
}

.profile-title {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
    position: relative;
    padding-bottom: 15px;
}

.profile-title:after {
    content: "";
    display: block;
    width: 100px;
    height: 3px;
    background: var(--primary-color);
    margin: 10px auto 0;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    font-weight: 500;
    color: #555;
}

.form-control {
    padding: 12px 15px;
    border-radius: 6px;
    border: 1px solid #ddd;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
}

.form-control[readonly] {
    background-color: #f8f9fa;
}

.btn-update {
    background-color: var(--primary-color);
    border: none;
    padding: 10px 30px;
    font-size: 16px;
    font-weight: 500;
    letter-spacing: 0.5px;
    transition: all 0.3s;
}

.btn-update:hover {
    background-color: var(--primary-hover);
    transform: translateY(-2px);
}

.error-message {
    color: var(--danger-color);
    background-color: #f8d7da;
    padding: 12px;
    border-radius: 5px;
    margin-bottom: 20px;
    text-align: center;
    border: 1px solid #f5c6cb;
}

@media (max-width: 768px) {
    .profile-card {
        padding: 20px;
    }
}
</style>
</head>
<body>

    <%@include file="header1.jsp"%>

    <div class="container profile-container">
        <% if (session.getAttribute("uname") != null) {
            try {
                Registration reg = new Registration(session);
                User u = reg.getUserInfo();
                if (u != null) { %>
                    <div class="profile-card">
                        <h2 class="profile-title"><i class="fas fa-user-edit"></i> EDIT PROFILE</h2>
                        
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        
                        <form action='register' method='POST'>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" name="uname" 
                                       value="<%= u.getUname() != null ? u.getUname() : "" %>" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" class="form-control" name="fname" 
                                       value="<%= u.getFname() != null ? u.getFname() : "" %>">
                            </div>
                            
                            <div class="form-group">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" name="pno" 
                                       value="<%= u.getPhone() != null ? u.getPhone() : "" %>">
                            </div>
                            
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" 
                                       value="<%= u.getEmail() != null ? u.getEmail() : "" %>">
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-lg btn-update" name="submit">
                                    <i class="fas fa-save"></i> Update Profile
                                </button>
                            </div>
                        </form>
                    </div>
                <% } else { %>
                    <div class="error-message">
                        <i class="fas fa-user-slash"></i> User information not found
                    </div>
                <% }
            } catch(Exception e) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i> Error: <%= e.getMessage() %>
                </div>
            <% }
        } else { %>
            <div class="error-message">
                <i class="fas fa-sign-in-alt"></i> Please login to access this page
            </div>
        <% } %>
    </div>

    <%@include file="footer1.jsp"%>

</body>
</html>