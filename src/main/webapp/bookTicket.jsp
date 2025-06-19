<%@ include file="header1.jsp" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>

<html>
<head>
    <title>Book Ticket</title>
    <style>
       
        .form-container {
            background-color: #fff;
            padding: 20px;
            width: 400px;
            margin: 10rem auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        .msg {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Book Your Ticket</h2>

    <form method="post" action="<%= request.getContextPath() %>/book"> 
        <input type="hidden" name="movie" value="<%= request.getParameter("movie") %>" />

        <label for="tickets">Number of Tickets:</label>
        <select name="tickets" id="tickets" required>
            <% for(int i=1; i<=10; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>

        <input type="submit" value="Book Now">
    </form>

    <% String msg = (String) request.getAttribute("msg");
       if (msg != null) { %>
        <div class="msg"><%= msg %></div>
    <% } %>
</div>

</body>
</html>

<%@ include file="footer1.jsp" %>
