<%@page import="java.util.*"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | BookMyShow Clone</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        background-color: #666666;
        color: white;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .table-container {
        margin: 2rem auto;
        max-width: 1200px;
        padding: 0 15px;
    }
    
    .table {
        background-color: #969696;
        border: 2px solid #333333;
        margin-bottom: 30px;
    }
    
    .table th {
        padding: 15px;
        background-color: #333333;
        color: white;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 600;
        border: none;
    }
    
    .table td {
        padding: 12px 15px;
        vertical-align: middle;
        border-top: 1px solid #777777;
    }
    
    .table tr:hover td {
        background-color: #777777;
    }
    
    .msg {
        color: white;
        background-color: #28a745;
        padding: 12px;
        margin: 20px auto;
        max-width: 1200px;
        border-radius: 5px;
        text-align: center;
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    
    .alert {
        max-width: 1200px;
        margin: 2rem auto;
    }
    
    .btn-delete {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 6px 16px;
        border-radius: 4px;
        transition: all 0.3s;
        font-weight: 500;
    }
    
    .btn-delete:hover {
        background-color: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    
    .section-title {
        text-align: center;
        font-family: 'Arial', sans-serif;
        color: #e63946;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        padding: 15px;
        border-bottom: 2px solid #ff758f;
        margin: 30px 0 20px;
        position: relative;
    }
    
    .section-title:after {
        content: "";
        display: block;
        width: 100px;
        height: 3px;
        background: #ff758f;
        margin: 10px auto;
    }
    
    .empty-message {
        text-align: center;
        padding: 20px;
        font-style: italic;
        color: #cccccc;
    }
</style>
</head>
<body>

    <%@include file="header1.jsp"%>

    <div class="table-container">
        <% if(session.getAttribute("uname") != null && session.getAttribute("id") != null && session.getAttribute("id").equals("1")) { 
            if(request.getAttribute("status") != null) { %>
                <div class="msg"><i class="fas fa-check-circle"></i> <%=request.getAttribute("status")%></div>
            <% } %>

            <h2 class="section-title">
                <i class="fas fa-users"></i> USER MANAGEMENT
            </h2>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
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
                    
                    if(udata != null && !udata.isEmpty()) {
                        Iterator<User> itr = udata.iterator();
                        while(itr.hasNext()) {
                            User u = itr.next(); 
                            if(!u.getId().equals("1")){
                            %>
                            <tr>
                                <td><%=u.getId()%></td>
                                <td><%=u.getFname()%></td>
                                <td><%=u.getUname()%></td>
                                <td><%=u.getPhone()%></td>
                                <td><%=u.getEmail()%></td>
                                <td>
                                    <form action="delete" method="post">
                                        <input type="hidden" name="uid" value="<%=u.getId()%>" />
                                        <button type="submit" class="btn-delete" name="delete">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <% }} 
                    } 
                    else { %>
                        <tr>
                            <td colspan="6" class="empty-message">No users found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <h2 class="section-title">
                <i class="fas fa-ticket-alt"></i> TICKET MANAGEMENT
            </h2>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Ticket ID</th>
                        <th>Movie</th>
                        <th>User Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/showbooking", "root", "root");
                        java.sql.Statement stmt = con.createStatement();
                        java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM ticket");

                        boolean hasTickets = false;
                        
                        while (rs.next()) {
                            hasTickets = true;
                    %>
                    <tr>
                        <td><%= rs.getInt("tid") %></td>
                        <td><%= rs.getString("movie_name") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td>
                            <form method="post" action="delete">
                                <input type="hidden" name="tid" value="<%= rs.getInt("tid") %>">
                                <button type="submit" name="deleteTicket" class="btn-delete">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                        
                        if (!hasTickets) {
                    %>
                    <tr>
                        <td colspan="4" class="empty-message">No booked tickets found</td>
                    </tr>
                    <%
                        }
                        rs.close(); stmt.close(); con.close();
                    %>
                </tbody>
            </table>
            
        <% } else { %>
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle"></i> You don't have permission to access this page.
            </div>
        <% } %>
    </div>

    

</body>
</html>