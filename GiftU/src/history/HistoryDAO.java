package history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HistoryDAO {
	
	Connection con;
	DataSource datasource;

	public void getConnection() {
		try {
	
			Context init = new InitialContext();
	
			datasource = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			con = datasource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public ArrayList<HistoryBean> getThreeMonthsPaymentHistory (String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<HistoryBean> list = new ArrayList<HistoryBean>();
		try {	
			String sql = "select * from paymenthistory where date >= date_add(now(),interval -3 month) and id = ? order by date desc";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setId(rs.getString("id"));
				bean.setOrder_number(rs.getString("order_number"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setPrice(rs.getInt("price"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setCount(rs.getInt("count"));
				bean.setPhone(rs.getString("phone"));
				bean.setName(rs.getString("name"));
				bean.setFilename(rs.getString("filename"));
				bean.setPayment_type(rs.getString("payment_type"));
				bean.setAll_price(rs.getInt("all_price"));
				bean.setAddress(rs.getString("address"));
				bean.setDetail_address(rs.getString("detail_address"));
				bean.setPostcode(rs.getString("postcode"));
				bean.setMsg(rs.getString("msg"));
				bean.setDelivery(rs.getString("delivery"));
				list.add(bean);
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("getThreeMonthsPaymentHistory() 메소드에서 발생한 에러입니다.");
			e.printStackTrace();
			
		}
		return list;
	}
	
	
	public ArrayList<HistoryBean> getSixMonthsPaymentHistory (String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<HistoryBean> list = new ArrayList<HistoryBean>();
		try {	
			String sql = "select * from paymenthistory where date >= date_add(now(),interval -6 month) and id = ? order by date desc";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setId(rs.getString("id"));
				bean.setOrder_number(rs.getString("order_number"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setPrice(rs.getInt("price"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setCount(rs.getInt("count"));
				bean.setPhone(rs.getString("phone"));
				bean.setName(rs.getString("name"));
				bean.setFilename(rs.getString("filename"));
				bean.setPayment_type(rs.getString("payment_type"));
				bean.setAll_price(rs.getInt("all_price"));
				bean.setAddress(rs.getString("address"));
				bean.setDetail_address(rs.getString("detail_address"));
				bean.setPostcode(rs.getString("postcode"));
				bean.setMsg(rs.getString("msg"));
				bean.setDelivery(rs.getString("delivery"));
				list.add(bean);
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("getSixMonthsPaymentHistory() 메소드에서 발생한 에러입니다.");
			e.printStackTrace();
			
		}
		return list;
	}
	
	public ArrayList<HistoryBean> getOneMonthPaymentHistory (String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<HistoryBean> list = new ArrayList<HistoryBean>();
		try {	
			String sql = "select * from paymenthistory where date >= date_add(now(),interval -1 month) and id = ? order by date desc";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setId(rs.getString("id"));
				bean.setOrder_number(rs.getString("order_number"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setPrice(rs.getInt("price"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setCount(rs.getInt("count"));
				bean.setPhone(rs.getString("phone"));
				bean.setName(rs.getString("name"));
				bean.setFilename(rs.getString("filename"));
				bean.setPayment_type(rs.getString("payment_type"));
				bean.setAll_price(rs.getInt("all_price"));
				bean.setAddress(rs.getString("address"));
				bean.setDetail_address(rs.getString("detail_address"));
				bean.setPostcode(rs.getString("postcode"));
				bean.setMsg(rs.getString("msg"));
				bean.setDelivery(rs.getString("delivery"));
				list.add(bean);
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("getOneMonthPaymentHistory() 메소드에서 발생한 에러입니다.");
			e.printStackTrace();
			
		}
		return list;
	}
		
		
	
	public ArrayList<HistoryBean> getBetweenPaymentHistory(String id, String startDate, String endDate) {
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<HistoryBean> list = new ArrayList<HistoryBean>();
		try {
			String sql = "select * from paymenthistory where id = ? and (date between ? and ?) order by date desc";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setId(rs.getString("id"));
				bean.setOrder_number(rs.getString("order_number"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setPrice(rs.getInt("price"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setCount(rs.getInt("count"));
				bean.setPhone(rs.getString("phone"));
				bean.setName(rs.getString("name"));
				bean.setFilename(rs.getString("filename"));
				bean.setPayment_type(rs.getString("payment_type"));
				bean.setAll_price(rs.getInt("all_price"));
				bean.setAddress(rs.getString("address"));
				bean.setDetail_address(rs.getString("detail_address"));
				bean.setPostcode(rs.getString("postcode"));
				bean.setMsg(rs.getString("msg"));
				bean.setDelivery(rs.getString("delivery"));
				list.add(bean);
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("getBetweenPaymentHistory() 메소드에서 발생한 에러입니다.");
			e.printStackTrace();
			
		}
		return list;
	}

	
	
	public ArrayList<HistoryBean> getAllPaymentHistory (String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		
		ArrayList<HistoryBean> list = new ArrayList<HistoryBean>();
		try {
			String sql = "select * from paymenthistory where id = ? order by date desc";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HistoryBean bean = new HistoryBean();
				bean.setId(rs.getString("id"));
				bean.setOrder_number(rs.getString("order_number"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setPrice(rs.getInt("price"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setCount(rs.getInt("count"));
				bean.setPhone(rs.getString("phone"));
				bean.setName(rs.getString("name"));
				bean.setFilename(rs.getString("filename"));
				bean.setPayment_type(rs.getString("payment_type"));
				bean.setAll_price(rs.getInt("all_price"));
				bean.setAddress(rs.getString("address"));
				bean.setDetail_address(rs.getString("detail_address"));
				bean.setPostcode(rs.getString("postcode"));
				bean.setMsg(rs.getString("msg"));
				bean.setDelivery(rs.getString("delivery"));
				list.add(bean);
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("allPaymentHistory() 메소드에서 발생한 에러입니다.");
			e.printStackTrace();
		}
		return list;
	}

	public String selectOrderNumber() {
		PreparedStatement pstmt;
		ResultSet rs;
		String orderNumber = null;
		try {
			String sql = "select order_number from paymenthistory order by order_number desc limit 1";
			getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderNumber = rs.getString("order_number");
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
			
		} catch (Exception e) {
			System.out.println("selectOrderNumber()메소드에서 발생한 에러 입니다.");
			e.printStackTrace();
		} 
		return orderNumber;
	}

	public int insertPaymentHistory(HistoryBean bean) {
		PreparedStatement pstmt;
		int result = 0; // insert문 실행 결과를 리턴하는 메소드
		try {
			String sql = "insert into paymenthistory (id,order_number,price,count,"
					+ "phone,name,filename,product_name,payment_type,"
					+ "all_price,address,detail_address,postcode,msg,delivery) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getOrder_number());
			pstmt.setInt(3, bean.getPrice());
			pstmt.setInt(4, bean.getCount());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getName());
			pstmt.setString(7, bean.getFilename());
			pstmt.setString(8, bean.getProduct_name());
			pstmt.setString(9, bean.getPayment_type());
			pstmt.setInt(10, bean.getAll_price());
			pstmt.setString(11, bean.getAddress());
			pstmt.setString(12, bean.getDetail_address());
			pstmt.setString(13, bean.getPostcode());
			pstmt.setString(14, bean.getMsg());
			pstmt.setString(15, bean.getDelivery());
			result = pstmt.executeUpdate();
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
		} catch (Exception e) {
			System.out.println("insertPaymentHistory()메소드에서 발생한 에러입니다.");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String id_list(String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		String hid = null;
		try {
			String sql = "select id from paymenthistory where id=?";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hid = rs.getString("id");
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
			
		} catch (Exception e) {
			System.out.println("id_list()메소드에서 발생한 에러 입니다.");
			e.printStackTrace();
		} 
		return hid;
	}
	
	public String fname_list(String id) {
		PreparedStatement pstmt;
		ResultSet rs;
		String fname = null;
		try {
			String sql = "select filename from paymenthistory where id=?";
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fname = rs.getString("filename");
			}
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}	
			
		} catch (Exception e) {
			System.out.println("fname_list()메소드에서 발생한 에러 입니다.");
			e.printStackTrace();
		} 
		return fname;
	}
}
