package model;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class Registration {
	
	HttpSession se=null;
	Connection con=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;

	public Registration(HttpSession session) {
		 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/showbooking", "root", "root");
			se=session;
		}
		 catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public String Registration(String fname, String uname, String phone, String email, String pw) throws SQLException {
	    String status = "";

	    try {
	        // Check if user exists (using prepared statement to prevent SQL injection)
	        pstmt = con.prepareStatement("SELECT * FROM user WHERE phone = ? AND email = ?");
	        pstmt.setString(1, phone);
	        pstmt.setString(2, email);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            status = "exist";
	        } else {
	            // Insert new user - let database handle slno (auto-increment) and date (default)
	            pstmt = con.prepareStatement("INSERT INTO user (fname, uname, phone, email, pw) VALUES (?, ?, ?, ?, ?)");
	            pstmt.setString(1, fname);
	            pstmt.setString(2, uname);
	            pstmt.setString(3, phone);
	            pstmt.setString(4, email);
	            pstmt.setString(5, pw);
	            
	            int x = pstmt.executeUpdate();
	            status = x > 0 ? "success" : "failure";
	        }
	    } finally {
	        // Close resources
	        if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	    }
	    
	    return status;
	}

	public String login(String username, String password) throws SQLException {
		String status="",fname="",phone="",email="",date="",id;
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from user where uname ='"+username+"'and pw='"+password+"'");
		
		boolean b=rs.next();
		if(b) {
			id=rs.getString(1);
			fname=rs.getString(2);
			email=rs.getString(4);
			phone=rs.getString(5);	
			date=rs.getString(7);	
			
            se.setAttribute("fname", fname);
            se.setAttribute("uname", username);
            se.setAttribute("id", id);
            se.setAttribute("date", date);
            se.setAttribute("email", email);
            se.setAttribute("phone", phone);
			
			status="suceess";
			
		}
		else {
			status="failed";
		}
		
		
		return status;
	}
	
	public ArrayList<User> getUserinfo(String id) throws SQLException{
		
		User u =new User();
		ArrayList<User> al=new ArrayList<User>();
		stmt=con.createStatement();
		String qury = "select * from user where slno='"+id+"'";
		
		rs=stmt.executeQuery(qury);
		
		if(rs.next()) {
			u.setFname(rs.getString("fname"));
			u.setUname(rs.getString("uname"));
			u.setEmail(rs.getString("email"));
			u.setPhone(rs.getString("phone"));
			u.setDate(rs.getString("date"));
			al.add(u);
		}
		
		return al;
		
	}
	
	public User getUserInfo() throws SQLException {
		
		User u = new User();
		
		stmt = con.createStatement();
		
		String qury="select * from User where slno='"+se.getAttribute("id")+"'";
		
		rs = stmt.executeQuery(qury);
		
		if(rs.next()) {
			u.setFname(rs.getString("fname"));
			u.setUname(rs.getString("uname"));
			u.setEmail(rs.getString("email"));
			u.setPhone(rs.getString("phone"));
			
		}
		
		return u;
	}

	public String updateUserData(String fname, String uname, String email, String phone) throws SQLException {
		int count=0;
		String status;
		stmt = con.createStatement();
		String qury="update User set fname='"+fname+"' ,uname='"+uname+"' , email='"+email+"',phone='"+phone+"' where slno='"+se.getAttribute("id")+"'";
		
		count = stmt.executeUpdate(qury);
		
		if(count>0)
			status="success";
		else
			status="failed";
		
		return status;
	}

	public ArrayList<User> userList() throws SQLException{
		ArrayList<User> al = new ArrayList();
		stmt = con.createStatement();
		String qury="select * from user";
		
		rs=stmt.executeQuery(qury);
		
		while(rs.next()) {
			User u = new User();
			u.setId(rs.getString("slno"));
			u.setFname(rs.getString("fname"));
			u.setUname(rs.getString("uname"));
			u.setPhone(rs.getString("phone"));
			u.setEmail(rs.getString("email"));
			al.add(u);
		}
		
		return al;
	}

	public String deleteUser(String id) throws SQLException {
		
		String status;
		stmt = con.createStatement();
		String qry = "delete from showbooking.user where slno='"+id+"'";
		
		int count=stmt.executeUpdate(qry);
		
		if(count>=1)
			status="success";
		else
			status="failed";
		
		return status;
	}
	
	public String bookTicket(String movieName, int ticketCount) throws SQLException {
	    String status = "";
	    String username = (String) se.getAttribute("uname");
	    
	    	if(( username == null)) {
	    		username = "unknownUser";
	    	}
	    
	  

	    try {
	        pstmt = con.prepareStatement("INSERT INTO ticket (username, movie_name, ticket_count) VALUES (?, ?, ?)");
	        pstmt.setString(1, username);
	        pstmt.setString(2, movieName);
	        pstmt.setInt(3, ticketCount);

	        int x = pstmt.executeUpdate();
	        status = x > 0 ? "success" : "failure";
	    } catch (Exception e) {
	        e.printStackTrace();
	        status = "error";
	    } finally {
	        if (pstmt != null) pstmt.close();
	    }

	    return status;
	}
	
	
	public ArrayList<Ticket> ticketList() throws SQLException{
		ArrayList<Ticket> al = new ArrayList();
		stmt = con.createStatement();
		String qury="select * from ticket";
		
		rs=stmt.executeQuery(qury);
		
		while(rs.next()) {
			Ticket t = new Ticket();
			t.setTid(rs.getString("tid"));
			t.setMovie_name(rs.getString("movie_name"));
			t.setBooking_time(rs.getString("booking_time"));
			t.setTicket_count(rs.getString("ticket_count"));
			t.setUsername(rs.getString("username"));
			al.add(t);
		}
		
		
		return al;
	}


	public String deleteTicket(String tid) throws SQLException {
	    String status = "failed";
	    pstmt = con.prepareStatement("DELETE FROM ticket WHERE tid = ?");
	    pstmt.setString(1, tid);

	    int result = pstmt.executeUpdate();
	    if (result > 0) status = "success";

	    pstmt.close();
	    return status;
	}

	
}
