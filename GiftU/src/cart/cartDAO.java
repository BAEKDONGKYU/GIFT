package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class cartDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

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

	public int getAmount(String id, int kind) {
		int amount = 0;
		try {
			getConnection();
			String sql = "select * from cart where id=? and kind=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, kind);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = rs.getInt("count");
				int price = rs.getInt("price");
				amount += count * price;
			}
			return amount;

		} catch (Exception e) {
			System.out.println("getAmount error");
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}

	private int getCartNum() {
		try {
			getConnection();
			String sql = "select max(num) from cart";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			con.close();
		} catch (Exception e) {
			System.out.println("getCartNum Error");
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}

	public void insertCart(cartBean bean, int num_) {
		int num = getCartNum();
		try {
			getConnection();

			String sql = "insert into cart(id,num,name,count,price,filename,date,kind,pro_num) values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			// num 주문번호
			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, num);
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getCount());
			pstmt.setInt(5, bean.getPrice());
			pstmt.setString(6, bean.getFilename());
			pstmt.setTimestamp(7, bean.getDate());
			pstmt.setInt(8, bean.getKind());
			pstmt.setInt(9, num_);
			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<cartBean> getCartList(String id, int kind) {
		List<cartBean> list = new ArrayList<cartBean>();
		try {

			getConnection();
			String sql = "select * from cart where id=? and kind=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, kind);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				cartBean bean = new cartBean();

				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setNum(rs.getInt("num"));
				bean.setPrice(rs.getInt("price"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setKind(rs.getInt("kind"));
				bean.setPro_num(rs.getInt("pro_num"));

				list.add(bean);
			}

		} catch (Exception e) {
			System.out.println("getCartList error");
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public void delList(int delList) {
		try {
			getConnection();
			String sql = "delete from cart where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, delList);
			pstmt.executeUpdate();

			con.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("delList cart error");
		}
	}

	public void modCart(int num, int count) {
		try {
			getConnection();
			String sql = "update cart set count=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, num);

			pstmt.executeUpdate();

			con.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println("modCart Error");
		}

	}

	public List<cartBean> getHeartList(String id, int kind) {
		List<cartBean> list = new ArrayList<cartBean>();
		try {
			getConnection();
			String sql = "select c.name,p.price,c.filename,p.inventory,c.pro_num,c.num from product p JOIN cart c on p.num = c.pro_num and c.id=? and c.kind=? order by c.date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, kind);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cartBean bean = new cartBean();
				bean.setId(id);
				bean.setKind(kind);
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setPrice(rs.getInt("price"));
				bean.setInventory(rs.getInt("inventory"));
				bean.setPro_num(rs.getInt("pro_num"));
				bean.setNum(rs.getInt("num"));
				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public void delHeartList(int num, int obj) {
		try {
			getConnection();

			String sql = "delete from cart where num=? and kind=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, obj);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	public int getCartAmount(String id, int kind) {
		int count = 0;
		try {
			getConnection();
			String sql = "select count(*) from cart where id=? and kind=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, kind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCartAmount error" + e);
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return 0;
	}

	public void delCart(int num) {
		try {
			getConnection();
			String sql = "delete from cart where pro_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public cartBean getCartInfo(int num) {
		cartBean cart = new cartBean();
		try {
			getConnection();
			String sql = "select * from cart where num = ?";  
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart.setCount(rs.getInt("count")); // 장바구니에 담은 숫자
				cart.setDate(rs.getTimestamp("date")); // 장바구니에 담은 시간
				cart.setFilename(rs.getString("filename")); // 장바구니에 담은 상품 이미지 이름
				cart.setId(rs.getString("id")); // 구매자 id
				cart.setKind(rs.getInt("kind")); // 관심 상품, 장바구니
				cart.setName(rs.getString("name"));
				cart.setNum(rs.getInt("num")); // 장바구니에 pk
				cart.setPrice(rs.getInt("price")); // 상품 단가
				cart.setPro_num(rs.getInt("pro_num")); // 상품 테이블의 상품 번호
			}
		} catch (Exception e) {
			System.out.println("getCartInfo()메소드에서 발생한 에러입니다.");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) { rs.close();}
				if(pstmt != null) { pstmt.close();}
				if(con != null) { con.close();}
			} catch (Exception e2) {
				System.out.println("자원해제 에러 발생");
			}
		}
		return cart;
	}
}
