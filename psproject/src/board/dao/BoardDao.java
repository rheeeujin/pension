package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.service.BoardService;
import board.vo.BoardVo;
import common.DBManager;

public class BoardDao  {
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null ;
	
	public static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao;
	}
	
	
	
	public void write() {
		
		
	}

	public void modify(BoardVo vo) {
		String sql = "UPDATE BOARD SET BOARDTITLE = ?, BOARDCONT = ?, REDATE = SYSDATE WHERE BOARDIDX = ?";
		conn= DBManager.getConnection();
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, vo.getTitle());
			pstmt.setString(++idx, vo.getCont());
			pstmt.setInt(++idx, vo.getBoardIdx());
			pstmt.executeUpdate();
			DBManager.close(conn, pstmt,rs);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
		
	public void delete(int boardidx) {
		String sql = "DELETE BOARD WHERE BOARDIDX = ?";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardidx);
			pstmt.executeUpdate();
			pstmt.close();
			DBManager.close(conn, pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		

	public List<BoardVo> list() {
		String sql = "SELECT * FROM BOARD WHERE PSIDX= ?";
		BoardVo vo = null;
		List<BoardVo> list = new ArrayList<>();
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVo();
				int idx1 = 0;
				vo.setBoardIdx(rs.getInt(++idx1));
				vo.setTitle(rs.getString(++idx1));
				vo.setCont(rs.getString(++idx1));
				vo.setCate(rs.getInt(++idx1));
				vo.setScore(rs.getInt(++idx1));
				vo.setRedate(rs.getDate(++idx1));
				vo.setEmail(rs.getString(++idx1));
				vo.setPsIdx(rs.getInt(++idx1));
			}
			conn.close();
			pstmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
