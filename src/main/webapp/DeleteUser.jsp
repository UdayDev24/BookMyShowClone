<%@page import="java.util.*"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete | Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
    body {
        background-color: #666666;
        color: white;
    }
    .table-container {
        margin: 2rem auto;
        max-width: 1200px;
    }
    .table {
        background-color: #969696;
        border: 2px solid #333333;
    }
    th {
        padding: 15px;
        background-color: #333333;
        color: white;
    }
    td {
        padding: 10px;
        vertical-align: middle;
    }
    .msg {
        color: white;
        background-color: #28a745;
        padding: 10px;
        margin: 20px auto;
        max-width: 1200px;
        border-radius: 5px;
        text-align: center;
    }
    .btn-delete {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 5px 15px;
        border-radius: 4px;
    }
    .btn-delete:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>

    <%@include file="header1.jsp"%>

    <div class="container table-container">
        <% if(session.getAttribute("uname") != null && session.getAttribute("id") != null && session.getAttribute("id").equals("1")) { 
            if(request.getAttribute("status") != null) { %>
                <div class="msg"><%=request.getAttribute("status")%></div>
            <% } %>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    Registration reg = new Registration(session);
                    ArrayList<User> udata = reg.userList();
                    
                    if(udata != null && !udata.isEmpty()&& !udata.get(0).getId().equals("1")) {
                        Iterator<User> itr = udata.iterator();
                        while(itr.hasNext()) {
                            User u = itr.next(); %>
                            <tr>
                                <td><%=u.getId()%></td>
                                <td><%=u.getFname()%></td>
                                <td><%=u.getUname()%></td>
                                <td><%=u.getPhone()%></td>
                                <td><%=u.getEmail()%></td>
                                <td>
                                    <form action="delete" method="post">
                                        <input type="hidden" name="uid" value="<%=u.getId()%>" />
                                        <button type="submit" class="btn-delete" name="delete">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        <% } 
                    } else { %>
                        <tr>
                            <td colspan="6" style="text-align: center;">No users found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="alert alert-danger" role="alert">
                You don't have permission to access this page.
            </div>
        <% } %>
        

<h2 style = "text-align:center;">Delete Booked Tickets</h2>
<div class="table-container">
    <table border="1" class="table">
        <tr><th>Ticket ID</th><th>Movie</th><th>User Name</th><th>Action</th></tr>
        <%
            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/showbooking", "root", "root");
            java.sql.Statement stmt = con.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM ticket");

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("tid") %></td>
            <td><%= rs.getString("movie_name") %></td>
            <td><%= rs.getString("username") %></td>
            <td>
                <form method="post" action="delete">
                    <input type="hidden" name="tid" value="<%= rs.getInt("tid") %>">
                    <input type="submit" name="deleteTicket" value="Delete" class="btn-delete">
                </form>
            </td>
        </tr>
        <%
            }
            rs.close(); stmt.close(); con.close();
        %>
    </table>
</div>
        
        
    </div>

    <%@include file="footer1.jsp"%>

</body>
</html>