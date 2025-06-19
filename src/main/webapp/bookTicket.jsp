<%@ include file="header1.jsp" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket | BookMyShow Clone</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
    :root {
        --primary-color: #007bff;
        --primary-hover: #0069d9;
        --success-color: #28a745;
        --bg-color: #666666;
        --form-bg: #ffffff;
    }
    
    body {
        background-color: var(--bg-color);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .booking-container {
        max-width: 500px;
        margin: 5rem auto;
        padding: 0 15px;
    }
    
    .booking-card {
        background-color: var(--form-bg);
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.15);
    }
    
    .booking-title {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
        position: relative;
        padding-bottom: 15px;
    }
    
    .booking-title:after {
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
        padding: 10px 15px;
        border-radius: 6px;
    }
    
    .btn-book {
        background-color: var(--primary-color);
        border: none;
        padding: 12px;
        font-size: 16px;
        font-weight: 500;
        width: 100%;
        transition: all 0.3s;
    }
    
    .btn-book:hover {
        background-color: var(--primary-hover);
        transform: translateY(-2px);
    }
    
    .success-message {
        color: var(--success-color);
        background-color: #d4edda;
        padding: 12px;
        border-radius: 5px;
        margin-top: 20px;
        text-align: center;
        border: 1px solid #c3e6cb;
    }
    
    @media (max-width: 576px) {
        .booking-card {
            padding: 20px;
        }
    }
    </style>
</head>
<body>

<div class="booking-container">
    <div class="booking-card">
        <h2 class="booking-title"><i class="fas fa-ticket-alt"></i> Book Your Ticket</h2>

        <form method="post" action="<%= request.getContextPath() %>/book"> 
            <input type="hidden" name="movie" value="<%= request.getParameter("movie") %>" />

            <div class="form-group">
                <label for="tickets">Number of Tickets:</label>
                <select class="form-control" name="tickets" id="tickets" required>
                    <% for(int i=1; i<=10; i++) { %>
                        <option value="<%= i %>"><%= i %> Ticket<%=(i>1?"s":"")%></option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary btn-book">
                <i class="fas fa-check-circle"></i> Book Now
            </button>
        </form>

        <% String msg = (String) request.getAttribute("msg");
           if (msg != null) { %>
            <div class="success-message mt-3">
                <i class="fas fa-check"></i> <%= msg %>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="footer1.jsp" %>
</body>
</html>