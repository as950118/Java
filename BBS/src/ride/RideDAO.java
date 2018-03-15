package ride;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bbs.Bbs;
import ride.Ride;

public class RideDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RideDAO(){
		try {
			String dbURL="jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "xodlfWkdWkd17!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Ride check(String rideNumber) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,rideNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.next()) {
					Ride ride = new Ride();
					ride.setRideNamekr(rs.getString(1));
					ride.setRideNameen(rs.getString(2));
					ride.setRideNumber(rs.getString(3));
					ride.setRideEmail(rs.getString(4));
					ride.setRideGender(rs.getString(5));
					ride.setRideCountry(rs.getString(6));
					ride.setRideModel(rs.getString(7));
					return ride;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int reserve(Ride ride){
		String SQL = "INSERT INTO RIDE VALUES (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,ride.getRideNamekr());
			pstmt.setString(2,ride.getRideNameen());
			pstmt.setString(3,ride.getRideNumber());
			pstmt.setString(4,ride.getRideEmail());
			pstmt.setString(5,ride.getRideGender());
			pstmt.setString(6,ride.getRideCountry());
			pstmt.setString(7,ride.getRideModel());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

