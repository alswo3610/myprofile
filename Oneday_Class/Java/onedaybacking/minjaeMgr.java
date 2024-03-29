package onedaybacking;

import java.text.SimpleDateFormat;
import java.util.Vector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class minjaeMgr {
	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");

	public minjaeMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 관리자 게시판 순번
	public int getMaxNumAdminBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNumAB = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from adminboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	        if (rs.next()) {
	            maxNumAB = rs.getInt(1) + 1; // 현재 최대값보다 1 큰 값
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNumAB;
	}
	
	
	// 관리자 게시판 리스트
	public Vector<boardBean> selectAllAdminBoards() {
		Vector<boardBean> boardList = new Vector<boardBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM adminboard ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardBean board = new boardBean();
				board.setNum(rs.getInt("num"));
				board.setEname(rs.getString("ename"));
				board.setKname(rs.getString("kname"));
				board.setUsevalue(rs.getString("usevalue"));
				board.setListvalue(rs.getString("listvalue"));
				board.setReadvalue(rs.getString("readvalue"));
				board.setWritevalue(rs.getString("writevalue"));
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return boardList;
	}
	
	
	// 관리자 게시판 만들기
	public void insertboard(boardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert adminboard values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			int listNum = getMaxNumAdminBoard();
			pstmt .setInt(1,  listNum);
			pstmt.setString(2, bean.getEname());
			pstmt.setString(3, bean.getKname());
			pstmt.setString(4, "0");
			pstmt.setString(5, bean.getListvalue());
			pstmt.setString(6, bean.getReadvalue());
			pstmt.setString(7, bean.getWritevalue());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
	// 관리자 게시판 지우기
	public void deleteboard(boardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from adminboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	// 유저 게시글 순번
	public int getMaxNumUserBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNumUB = 0;
		try {
			con = pool.getConnection();
			sql = "select max(announceNum) from announce";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	        if (rs.next()) {
	            maxNumUB = rs.getInt(1) + 1; // 현재 최대값보다 1 큰 값
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNumUB;
	}

	
	// 유저 게시글 작성
	public void writeboard(announceBean bean) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    try {
	        con = pool.getConnection();
	        sql = "insert into announce (announceSubject, announceContent, announceWriter, announceDay, announceView) values (?,?,?,?,?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, bean.getAnnounceSubject());
	        pstmt.setString(2, bean.getAnnounceContent());
	        pstmt.setString(3, bean.getAnnounceWriter());
	        pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis())); // 현재 시간을 Timestamp 형식으로 설정
	        pstmt.setInt(5, 0); // 조회수 초기값 0으로 설정
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	}

	
	// 유저 게시글 리스트
	public Vector<announceBean> selectAllUserBoards() {
		Vector<announceBean> announceList = new Vector<announceBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM announce ORDER BY announceNum DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				announceBean announce = new announceBean();
				announce.setAnnounceNum(rs.getInt("announceNum"));
				announce.setAnnounceSubject(rs.getString("announceSubject"));
				announce.setAnnounceContent(rs.getString("announceContent"));
				announce.setAnnounceWriter(rs.getString("announceWriter"));
				announce.setAnnounceDay(rs.getString("announceDay"));
				announce.setAnnounceView(rs.getInt("announceView"));
				announceList.add(announce);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return announceList;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	// PageCount 아직 안씀
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")||keyWord==null) {
				//검색이 아닌 경우
				sql = "select count(*) from announce";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from announce " + "where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next())totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

}
