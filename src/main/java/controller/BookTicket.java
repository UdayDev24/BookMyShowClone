package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import model.Registration;

@WebServlet("/book")
public class BookTicket extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String movie = req.getParameter("movie");
        int ticketCount = Integer.parseInt(req.getParameter("tickets"));
        String result;

        try {
            result = new Registration(session).bookTicket(movie, ticketCount);
        } catch (Exception e) {
            e.printStackTrace();
            result = "error";
        }

        if ("success".equals(result)) {
            req.setAttribute("msg", "Ticket booked for " + movie + " (" + ticketCount + " tickets)");
        } else {
            req.setAttribute("msg", "Failed to book ticket.");
        }
        req.getRequestDispatcher("bookTicket.jsp").forward(req, resp);
    }
}
