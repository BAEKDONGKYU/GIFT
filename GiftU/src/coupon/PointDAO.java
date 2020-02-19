package coupon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PointDAO {

	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}// getConnection()

	//////////////////////////////////// 적립금 확인하기
	public List<PointBean> getPointList(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		PointBean pBean = null;

		List<PointBean> pointList = new ArrayList<PointBean>();

		try {
			con = getConnection();

			sql = "select * from point where id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				pBean = new PointBean();

				pBean.setNum(rs.getInt("num"));
				pBean.setId(rs.getString("id"));
				pBean.setBetwen(rs.getString("betwen"));
				pBean.setPoint(rs.getInt("point"));
				pBean.setDay(rs.getTimestamp("day"));
				pBean.setContent(rs.getString("content"));
				pBean.setTotal(rs.getInt("total"));

				pointList.add(pBean);
			}
		} catch (Exception err) {
			System.out.println("적립금 보기 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return pointList;
	}
	
	
	//////////////////////////////////// 가장 최근의 토탈값을 가져옴 = 현재 적립금 확인
	public int getTotal(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int total=0;
		
		try{
			con = getConnection();
			
			sql = "select total from point where id = ? order by num desc;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
		} catch (Exception err) {
			System.out.println("토탈값 오류 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return total;
	}

	//////////////////////////////////// 해당 쿠폰 중복 체크 후 없으면 해당 쿠폰을 추가하는 메소드
	public void insertPoint(String id, PointBean pBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0;

		try {
			con = getConnection();

			sql = "select max(num) from point";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
			sql = "insert into point(num,id,betwen,point,day,content,total)"
					+ " values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			
			if(pBean.getBetwen() == "+"){

				pstmt.setInt(1, num);
				pstmt.setString(2, id);
				pstmt.setString(3, pBean.getBetwen());
				pstmt.setInt(4, pBean.getPoint());
				pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
				pstmt.setString(6, pBean.getContent());
				pstmt.setInt(7, pBean.getTotal()+pBean.getPoint());
				
			}else if(pBean.getBetwen() == "-"){

				pstmt.setInt(1, num);
				pstmt.setString(2, id);
				pstmt.setString(3, pBean.getBetwen());
				pstmt.setInt(4, pBean.getPoint());
				pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
				pstmt.setString(6, pBean.getContent());
				pstmt.setInt(7, pBean.getTotal()-pBean.getPoint());
			}
			
			pstmt.executeUpdate();
			
		} catch (Exception err) {
			System.out.println("포인트 추가에서 오류 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}
}