package ch15;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/JSP/myapp/src/main/webapp/ch15/fileupload";
	public static final String ENCODING = "UTF-8";
	public static final int MAXSIZE = 1024 * 1024 * 20; //20MB
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Board Insert
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			File dir = new File(SAVEFOLDER);
			if (!dir.exists())
				dir.mkdirs(); //상위 폴더가 없어도 생성
							   //mkdir = 상위 폴더가 없으면 생성 불가
			MultipartRequest multi = new MultipartRequest(req,  SAVEFOLDER, MAXSIZE, ENCODING, new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;
			
			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			
			String content = multi.getParameter("content");
			String contentType = multi.getParameter("contentType");
			
			if (contentType.equals("TEXT")) {
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			
			int ref = getMaxNum() + 1; //답변을 위한 ref값 설정
			
			con = pool.getConnection();
			sql = "insert tblBoard(name, content, subject, ref, pos, depth, regdate, pass, count, ip, filename, filesize) values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Board Max Num : num의 현재 최대값
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	//Board Total Count : 총 게시물 수
	
	
	//Board List : 검색기능, 페이징 및 블럭
	
	
	//Board Read : 13개 컬럼 모두 리턴
	
	
	//Count Up : 조회수 증가
	
	
	//Board Delete : 첨부된 파일 삭제
	
	
	//Board Update : 파일업로드 수정
	
	
	//Board Reply : 답변글 저장
	
	
	//Board Reply Up : 다변글 위치값 수정
	
	
	//게시물 1000개 입력
	
	
	public static void main(String[] args) {
		
	}
}