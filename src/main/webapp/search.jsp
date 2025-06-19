<%@page import="java.util.*"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Users | Admin Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        background-color: #666666;
        color: white;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .search-container {
        max-width: 800px;
        margin: 30px auto;
        padding: 0 15px;
    }
    
    .search-card {
        background-color: #666666;
        border-radius: 8px;
        padding: 25px;
        margin-bottom: 30px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        border: 1px solid #777777;
    }
    
    .search-title {
        color: white;
        text-align: center;
        margin-bottom: 25px;
        font-size: 28px;
        position: relative;
        padding-bottom: 15px;
    }
    
    .search-title:after {
        content: "";
        display: block;
        width: 80px;
        height: 3px;
        background: #ff758f;
        margin: 10px auto 0;
    }
    
    .search-form {
        max-width: 500px;
        margin: 0 auto;
    }
    
    .form-label {
        font-weight: 500;
        margin-bottom: 8px;
    }
    
    .btn-search {
        background-color: #007bff;
        padding: 8px 25px;
        font-weight: 500;
        letter-spacing: 0.5px;
        margin-top: 10px;
    }
    
    .btn-search:hover {
        background-color: #0069d9;
        transform: translateY(-2px);
    }
    
    .results-container {
        background-color: #666666;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }
    
    .table {
        margin-bottom: 0;
        color: white;
    }
    
    .table th {
        background-color: #333333;
        padding: 15px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 600;
        border: none;
    }
    
    .table td {
        padding: 12px 15px;
        vertical-align: middle;
        border-top: 1px solid #777777;
    }
    
    .error-message {
        background-color: #dc3545;
        color: white;
        padding: 12px;
        border-radius: 5px;
        margin: 20px auto;
        max-width: 800px;
        text-align: center;
    }
    
    .empty-message {
        text-align: center;
        padding: 20px;
        color: #cccccc;
        font-style: italic;
    }
</style>
</head>
<body>

    <%@include file="header1.jsp"%>
        
    <div class="search-container">
        <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) { %>
        
        <div class="search-card">
            <h2 class="search-title">
                <i class="fas fa-search"></i> User Search
            </h2>
            <form action="search" method="POST" class="search-form">
                <div class="form-group">
                    <label class="form-label">Enter User ID:</label>
                    <input type="text" name="id" class="form-control" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-search" name="submit">
                        <i class="fas fa-search"></i> Search
                    </button>
                </div>
            </form>
        </div>
        
        <% if (request.getParameter("id") != null && !request.getParameter("id").trim().isEmpty()) { 
            try {
                Registration reg = new Registration(session);
                ArrayList<User> userdata = reg.getUserinfo(request.getParameter("id"));
        %>
        <div class="results-container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Registration Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(userdata == null || userdata.isEmpty()) { %>
                    <tr>
                        <td colspan="5" class="empty-message">No records found for this user ID</td>
                    </tr>
                    <% } else { 
                        Iterator<User> itr = userdata.iterator();
                        while (itr.hasNext()) {
                            User u = itr.next();
                    %>
                    <tr>
                        <td><%=u.getFname()%></td>
                        <td><%=u.getUname()%></td>
                        <td><%=u.getPhone()%></td>
                        <td><%=u.getEmail()%></td>
                        <td><%=u.getDate()%></td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
        <% } catch(Exception e) { %>
        <div class="error-message">
            <i class="fas fa-exclamation-circle"></i> Error: <%= e.getMessage() %>
        </div>
        <% } } %>
        
        <% } else { %>
        <div class="error-message">
            <i class="fas fa-exclamation-triangle"></i> You don't have permission to access this page
        </div>
        <% } %>
    </div>
    
    <%@include file="footer1.jsp"%>

</body>
</html>