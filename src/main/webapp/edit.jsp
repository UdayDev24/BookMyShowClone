<%@page import="java.util.*"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
    .jumbotron {
        background-color: #FFFFFF;
        max-width: 800px;
        margin: 2rem auto;
    }
    .errmsg {
        color: red;
        padding: 10px;
        text-align: center;
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    body {
        background-color: #666666;
    }
</style>
</head>
<body>

    <%@include file="header1.jsp"%>

    <div class="container">
        <% if (session.getAttribute("uname") != null) {
            try {
                Registration reg = new Registration(session);
                User u = reg.getUserInfo();
                if (u != null) { %>
                    <div class="jumbotron">
                        <h1 class="text-center">EDIT PROFILE</h1>
                        
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="errmsg"><%= request.getAttribute("error") %></div>
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
                                <button type="submit" class="btn btn-primary btn-lg" name="submit">Update</button>
                            </div>
                        </form>
                    </div>
                <% } else { %>
                    <div class="errmsg">User information not found</div>
                <% }
            } catch(Exception e) { %>
                <div class="errmsg">Error: <%= e.getMessage() %></div>
            <% }
        } else { %>
            <div class="errmsg">Please login to access this page</div>
        <% } %>
    </div>

    <%@include file="footer1.jsp"%>

</body>
</html>