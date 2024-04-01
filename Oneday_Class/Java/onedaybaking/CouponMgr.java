package onedaybaking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class CouponMgr {
	DBConnectionMgr pool;
	
	public CouponMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//쿠폰 리스트
	public Vector<CouponBean> couponList(String memberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CouponBean> vlist = new Vector<CouponBean>();
		try {
			con = pool.getConnection();
			sql = "select * from coupon where memberId=? and couponStatus='N' order by couponKey desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				CouponBean cpBean = new CouponBean();
				cpBean.setCouponKey(rs.getInt(1));
				cpBean.setCouponName(rs.getString(2));
				cpBean.setCouponPrice(rs.getInt(3));
				cpBean.setCouponDown(rs.getString(4));
				cpBean.setCouponClose(rs.getString(5));
				cpBean.setCouponStatus(rs.getString(6));
				cpBean.setMemberId(rs.getString(7));
				vlist.addElement(cpBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}
