package onedaybaking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberMgr {
	DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//아이디 중복 확인
	public boolean checkId(String memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select memberId from member where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();
			if(rs.next()) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//회원가입
	public boolean insertMember(MemberBean mBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert member values(?,?,?,?,?,?,?,?,?,null,null,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getMemberId());
			pstmt.setString(2, mBean.getMemberPwd());
			pstmt.setString(3, mBean.getMemberName());
			pstmt.setString(4, mBean.getMemberBirth());
			pstmt.setString(5, mBean.getMemberSex());
			pstmt.setString(6, mBean.getMemberNick());
			pstmt.setString(7, mBean.getMemberPhone());
			pstmt.setString(8, "N");
			pstmt.setInt(9, 1);
			if(pstmt.executeUpdate() == 1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//로그인
	public boolean login(String memberId, String memberPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select memberId, memberPwd from member where memberId=? and memberPwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);

			rs = pstmt.executeQuery();
			if(rs.next()) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//아이디 찾기
	public String idSearch(String memberName, String memberPhone, String memberBirth) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String idResult = "";
		try {
			con = pool.getConnection();
			sql = "select memberId from member where memberName=? and memberPhone=? and memberBirth=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPhone);
			pstmt.setString(3, memberBirth);

			rs = pstmt.executeQuery();
			if(rs.next()) idResult = rs.getString("memberId");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return idResult;
	}
	//비밀번호 찾기
	public String passwordSearch(String memberId, String memberName) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String passwordResult = "";
		try {
			con = pool.getConnection();
			sql = "select memberId from member where memberId=? and memberName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			rs = pstmt.executeQuery();
			if(rs.next()) passwordResult = rs.getString("memberId");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return passwordResult;
	}
	//새비밀번호 입력
	public boolean passwordUpdate(String memberId, String memberPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update member set memberPwd=? where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPwd);
			pstmt.setString(2, memberId);

			if(pstmt.executeUpdate() == 1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//회원정보 가져오기
	public MemberBean memberList(String memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		try {
			con = pool.getConnection();
			sql = "select * from member where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setMemberId(rs.getString("memberId"));
				bean.setMemberPwd(rs.getString("memberPwd"));
				bean.setMemberName(rs.getString("memberName"));
				bean.setMemberBirth(rs.getString("memberBirth"));
				bean.setMemberSex(rs.getString("memberSex"));
				bean.setMemberNick(rs.getString("memberNick"));
				bean.setMemberPhone(rs.getString("memberPhone"));
				bean.setSignout(rs.getString("signout"));
				bean.setAuth(rs.getInt("auth"));
				bean.setMemberInfoImg(rs.getString("memberInfoImg"));
				bean.setMemverInfo(rs.getString("memberInfo"));
				bean.setMemberdate(rs.getString("memberdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//회원수정 비밀번호 확인
	public boolean passwordCheck(String memberId, String memberPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select memberPwd from member where memberId=? and memberPwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs = pstmt.executeQuery();
			if(rs.next()) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//회원정보 수정
	public boolean memberUpdate(MemberAddressBean maBean, MemberBean mBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update member set memberName=?, memberNick=?, memberPhone=? where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getMemberName());
			pstmt.setString(2, mBean.getMemberNick());
			pstmt.setString(3, mBean.getMemberPhone());
			pstmt.setString(4, mBean.getMemberId());
			int cnt = pstmt.executeUpdate();
			pstmt.close();
			
			if(cnt == 1) {
				sql="select memberId from memberaddress where memberId=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mBean.getMemberId());
				ResultSet rs = pstmt.executeQuery();
				if(!rs.next()) {
					sql = "insert memberaddress values(null,null,?,?,?,null,null,null,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, maBean.getZipcode());
					pstmt.setString(2, maBean.getAddress());
					pstmt.setString(3, maBean.getAddressDetail());
					pstmt.setString(4, mBean.getMemberId());
				} else {
					sql = "update memberaddress set zipcode=?, address=?, addressDetail=? where memberId=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, maBean.getZipcode());
					pstmt.setString(2, maBean.getAddress());
					pstmt.setString(3, maBean.getAddressDetail());
					pstmt.setString(4, maBean.getMemberId());
				}
			
				if(pstmt.executeUpdate() == 1) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//기본 배송지 정보 가져오기{
	public MemberAddressBean AddressList(String memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberAddressBean maBean = new MemberAddressBean();
		try {
			con = pool.getConnection();
			sql = "select * from memberAddress where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				maBean.setAddrKey(rs.getInt(1));
				maBean.setName(rs.getString(2));
				maBean.setZipcode(rs.getString(3));
				maBean.setAddress(rs.getString(4));
				maBean.setAddressDetail(rs.getString(5));
				maBean.setPhone(rs.getString(6));
				maBean.setRequest(rs.getString(7));
				maBean.setDef(rs.getInt(7));
				maBean.setMemberId(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maBean;
	}
	//강사소개 업데이트
	public boolean teacherInfo(String memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update member set memberInfo=? where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			if( pstmt.executeUpdate() == 1) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
}
