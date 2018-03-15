package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//작성시간
	public String getDate() {
		String SQL = "SELECT NOW()";	//현재 시간 반환하는 mysql 문장
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";//DB오류
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC ";	//내림차순으로 해서 가장 첫번째, 즉 마지막째를 가져옴
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1;//첫번쨰 게시물인 경우
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;//DB오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";	//작성자 정보를 가져옴
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);	//available이므로 1(보이는 상태)
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;//DB오류
		
	}
	
	public ArrayList<Bbs> getList(int pageNumber){ // ctrl + shift + o == 외부라이브러리에서 가져옴
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";	//내림차순으로 해서 가장 첫번째, 즉 마지막째를 가져옴
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10); //페이지네이션을 위해
			rs = pstmt.executeQuery();
			while(rs.next()) { //10혹은 10이안되면 그전까지가 될때까지
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
		
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";	//내림차순으로 해서 가장 첫번째, 즉 마지막째를 가져옴
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10); //페이지네이션을 위해
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";	//내림차순으로 해서 가장 첫번째, 즉 마지막째를 가져옴
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection을 방어하기위해, 충돌방지를 위해 함수안으로 이동함
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}

}
