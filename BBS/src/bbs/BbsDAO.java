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
	
	//�ۼ��ð�
	public String getDate() {
		String SQL = "SELECT NOW()";	//���� �ð� ��ȯ�ϴ� mysql ����
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";//DB����
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC ";	//������������ �ؼ� ���� ù��°, �� ������°�� ������
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1;//ù���� �Խù��� ���
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;//DB����
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";	//�ۼ��� ������ ������
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);	//available�̹Ƿ� 1(���̴� ����)
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;//DB����
		
	}
	
	public ArrayList<Bbs> getList(int pageNumber){ // ctrl + shift + o == �ܺζ��̺귯������ ������
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";	//������������ �ؼ� ���� ù��°, �� ������°�� ������
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10); //���������̼��� ����
			rs = pstmt.executeQuery();
			while(rs.next()) { //10Ȥ�� 10�̾ȵǸ� ���������� �ɶ�����
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
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";	//������������ �ؼ� ���� ù��°, �� ������°�� ������
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
			pstmt.setInt(1,  getNext() - (pageNumber-1) * 10); //���������̼��� ����
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
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";	//������������ �ؼ� ���� ù��°, �� ������°�� ������
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL); //sql injection�� ����ϱ�����, �浹������ ���� �Լ������� �̵���
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
