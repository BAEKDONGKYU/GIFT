package coupon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ListCouponDAO {

	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}// getConnection()

	////////////////////////////////////	쿠폰 보기
	public List<ListCouponBean> getCouponList() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ListCouponBean cBean = null;

		List<ListCouponBean> couponList = new ArrayList<ListCouponBean>();

		try {
			con = getConnection();

			sql = "select * from couponlist order by num desc";

			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				cBean = new ListCouponBean();

				cBean.setNum(rs.getInt("num"));
				cBean.setSubject(rs.getString("subject"));
				cBean.setContent(rs.getString("content"));
				cBean.setMulti(rs.getInt("multi"));
				cBean.setPrice(rs.getInt("price"));
				cBean.setDay1(rs.getTimestamp("day1"));
				cBean.setDay2(rs.getTimestamp("day2"));
				cBean.setPercent(rs.getInt("percent"));

				couponList.add(cBean);
			}
		} catch (Exception err) {
			System.out.println("쿠폰 목록 보기에서 오류 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return couponList;
	}
		
	////////////////////////////////////	해당 쿠폰 중복 체크 후 없으면 해당 쿠폰을 추가하는 메소드
	public int insertCoupon(ListCouponBean cBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		int num = 0;

		try {
			con = getConnection();
			
			sql = "select max(num) from couponlist";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
			sql = "select * from couponlist where subject = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cBean.getSubject());
		
			rs = pstmt.executeQuery();

			if(rs.next()) {
				check = 1;
			}else{
				check = 0;
				sql = "insert into couponlist(num,subject,content,multi,price,day1,day2,percent,after)"
						+ " values(?,?,?,?,?,?,?,?,?)";
					
				pstmt = con.prepareStatement(sql);
					
				pstmt.setInt(1, num);
				pstmt.setString(2, cBean.getSubject());
				pstmt.setString(3, cBean.getContent());
				pstmt.setInt(4, cBean.getMulti());
				pstmt.setInt(5, cBean.getPrice());
				pstmt.setTimestamp(6, cBean.getDay1());
				pstmt.setTimestamp(7, cBean.getDay2());
				pstmt.setInt(8, cBean.getPercent());
				pstmt.setInt(9, 0);
					
				pstmt.executeUpdate();
			}
		} catch (Exception err) {
			System.out.println("쿠폰 추가에서 오류 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return check;
	}
	
	////////////////////////////////////	매일 실행하여 유통기한 지난 쿠폰 삭제
/*	public void updateCoupon() {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			
			sql = "delete from couponlist where day2 < sysdate";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("쿠폰 날짜 확인 후 제거에서 오류 발생 : " + err);
		} finally {
			try {if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}*/

}