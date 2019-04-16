package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import common.DBManager;
import member.vo.Member;

/**
 * 
 *  @author 서재진
 *
 */

public class MemberDao {
	static MemberDao dao = new MemberDao();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return dao;
	}

	public Member login(String email, String pw) {
		// TODO Auto-generated method stub
		Member vo = null;
		String sql = "SELECT EMAIL,NAME,RATING,TEL,ADDRESS,PW FROM MEMBER WHERE EMAIL=? AND PW=? ";
		conn = DBManager.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, common.SecurityUtil.encryptSHA256(pw));
			rs = pstmt.executeQuery();
			if (rs.next()) {	
				vo = new Member();
				int idx = 0;
			
				vo.setEmail(rs.getString(++idx));
				vo.setName(rs.getString(++idx));
				 vo.setRating(rs.getInt(++idx));
			    vo.setTel(rs.getString(++idx));
			    vo.setAddress(rs.getString(++idx));
			    vo.setPw(rs.getString(++idx));
			}
			DBManager.close(conn, pstmt, rs);

		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return vo;
	}

	public void logout() {
		// TODO Auto-generated method stub

	}

	public void join(Member vo) {

		{
			// TODO Auto-generated method stub
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,SYSDATE)";
			conn = DBManager.getConnection();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				int idx = 0;
				pstmt.setString(++idx, vo.getEmail());
				pstmt.setString(++idx, common.SecurityUtil.encryptSHA256(vo.getPw()));
				pstmt.setString(++idx, vo.getName());
				pstmt.setString(++idx, vo.getAddress());
				pstmt.setString(++idx, vo.getTel());
				pstmt.setInt(++idx, vo.getRating());
				pstmt.executeUpdate();
				DBManager.close(conn, pstmt);
			} catch (SQLException e) {
			
			e.printStackTrace();
		
		
	
	}
		}
	}

	
	

	public void resign(String email) {
	
		
		String sql = "DELETE MEMBER WHERE EMAIL=?";
		conn = DBManager.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx,email);
			pstmt.executeUpdate();
			DBManager.close(conn, pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
		
		
		
		

	public void mypage(Member vo) {
		String sql = "update member set pw=?,name=?,tel=?,address=? where email=?";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			
			pstmt.setString(++idx,common.SecurityUtil.encryptSHA256(vo.getPw()));
			pstmt.setString(++idx,vo.getName());
		    pstmt.setString(++idx,vo.getTel());
		    pstmt.setString(++idx,vo.getAddress());
		    pstmt.setString(++idx, vo.getEmail());
			pstmt.executeUpdate();
			DBManager.close(conn, pstmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	}

