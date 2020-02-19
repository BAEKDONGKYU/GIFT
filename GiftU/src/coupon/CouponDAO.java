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

public class CouponDAO {

	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}// getConnection()

	////////////////////////////////////	내 쿠폰 보기		id값
	public List<CouponBean> getCouponList(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		CouponBean cBean = null;

		List<CouponBean> couponList = new ArrayList<CouponBean>();

		try {
			con = getConnection();

			sql = "select * from coupon where id = ? and after = 0";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				cBean = new CouponBean();

				cBean.setNum(rs.getInt("num"));
				cBean.setId(rs.getString("id"));
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
	
	

	////////////////////////////////////	쿠폰 갯수	id값
	public int getCouponCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = getConnection();
			
			sql = "select count(*) from coupon where id = ? and after = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception err) {
			System.out.println("쿠폰 갯수 불러오기에서 오류 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return count;
	}
	
	
	////////////////////////////////////	해당 쿠폰 중복 체크 후 없으면 해당 쿠폰을 추가하는 메소드
	public int insertCoupon(String id, String coupon){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		int num = 0;

		try {
			con = getConnection();
			
			sql = "select max(num) from coupon";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
			sql = "select * from coupon where id = ? and subject = ?";
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, id);
			pstmt.setString(2, coupon);
		
			rs = pstmt.executeQuery();

			if(rs.next()) {
				check = 1;
			}else{
				check = 0;
				sql = "insert into coupon(num,id,subject,content,multi,price,day1,day2,percent,after)"
						+ " values(?,?,?,"										//num, id, subject는 가져온 값 넣으
						+ "(select content from couponlist where subject=?),"	//쿠폰 내용
						+ "(select multi from couponlist where subject=?),"		//일부상품:0 / 전체상품:1
						+ "(select price from couponlist where subject=?),"		//쿠폰 사용 조건 가격
						+ "(select day1 from couponlist where subject=?),"		//쿠폰 시작 일
						+ "(select day2 from couponlist where subject=?),"		//쿠폰 마감 일
						+ "(select percent from couponlist where subject=?),"	//쿠폰 할인률
						+ "0)";													//사용 전:0 / 사용후:1
					
				pstmt = con.prepareStatement(sql);
					
				pstmt.setInt(1, num);
				pstmt.setString(2, id);
				pstmt.setString(3, coupon);
				pstmt.setString(4, coupon);
				pstmt.setString(5, coupon);
				pstmt.setString(6, coupon);
				pstmt.setString(7, coupon);
				pstmt.setString(8, coupon);
				pstmt.setString(9, coupon);
					
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
	public void updateCoupon() {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			
			sql = "delete from coupon where day2 < sysdate";
			
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
	}
	
	
	////////////////////////////////////	쿠폰 사용 시 해당 쿠폰 사용했다고 표시
	public void deleteCoupon(CouponBean cBean){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		
		try{
			con = getConnection();
			
			sql = "update coupon set after=1 where id=? and subject=? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, cBean.getId());
			pstmt.setString(2, cBean.getSubject());

			pstmt.executeUpdate();
			
		} catch (Exception err) {
			System.out.println("쿠폰 사용 표시에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}
}