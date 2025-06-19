
package model;

public class Ticket {
	
	private String tId;
	private String movie_name;
	private String booking_time;
	private String ticket_count;
	private String username;

	
	public String getTid() {
		return tId;
	}

	public void setTid(String tId) {
		this.tId = tId;
	}

	public String getMovie_name() {
		return movie_name;
	}
	
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getTicket_count() {
//		System.out.println(email+"email");
		return ticket_count;
	}
	
	public void setTicket_count(String ticket_count) {
		this.ticket_count = ticket_count;
	}
	
	public String getBooking_time() {
		return booking_time;
	}
	
	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}

}
