package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;
import product_comment.Product_commentBean;

public class ProductDAO {

	// �����ͺ��̽� ���� �۾��� ���� ���ѻ� ��ü�� ������ ���� ����
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// Ŀ�ؼ�Ǯ ��ü�� ������ ����
	DataSource datasource;

	// �޼ҵ� : Ŀ�ؼ�Ǯ ���, Ŀ�ؼ�Ǯ ������ Ŀ�ؼ� ��ü�� ��� con������ ����
	public void getConnection() {
		try {
			Context init = new InitialContext();
			datasource = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			con = datasource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private int getNum() {  // 최신 글번호 얻기
		String sql = "";
		int num = 0;
		try {
			getConnection();
			sql = "select max(num) from product";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null){
					con.close();
				}
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return num;
	}
	
	public ProductBean getProduct(int num) { // 상품에 대한 정보 얻기
		ProductBean bean = new ProductBean();
		try {
			getConnection();
			String sql = "select * from product where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				bean.setAge(rs.getInt("age"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setFilename(rs.getString("filename"));
				bean.setEvent(rs.getString("event"));
				bean.setGender(rs.getString("gender"));
				bean.setInventory(rs.getInt("inventory"));
				bean.setName(rs.getString("name"));
				bean.setNum(rs.getInt("num"));
				bean.setPrice(rs.getInt("price"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setSell(rs.getInt("sell"));
				bean.setFilename1(rs.getString("filename1"));
				bean.setFilename2(rs.getString("filename2"));
			}
		} catch (Exception e) {
			System.out.println("asda");
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

		return bean;
	}
	

	public void addProduct(ProductBean bean) { // 상품등록
		String sql = "";
		int num = getNum();
		try {
			getConnection();
		
			sql = "insert into product(num,name,price,event,gender,age,inventory,content,filename,date,readcount,sell,filename1,filename2) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getPrice());
			pstmt.setString(4, bean.getEvent());
			pstmt.setString(5, bean.getGender());
			pstmt.setInt(6, bean.getAge());
			pstmt.setInt(7, bean.getInventory());
			pstmt.setString(8, bean.getContent());
			pstmt.setString(9, bean.getFilename());
			pstmt.setTimestamp(10, bean.getDate());
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			pstmt.setString(13, bean.getFilename1());
			pstmt.setString(14, bean.getFilename2());

			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println("aa");
			e.printStackTrace();
		}
	}

	public List getListProducts(Map productMap) {  // 상품 리스트 
		List list = new ArrayList();

		try {
			getConnection();

			System.out.println(productMap.get("section"));
			System.out.println(productMap.get("pageNum"));

			int section = (Integer) productMap.get("section");
			int pageNum = (Integer) productMap.get("pageNum");
			int start = (section - 1) * 90 + (pageNum - 1) * 9;
			int end = (section - 1) * 90 + pageNum * 9;

			String sql = "select @rownum:=@rownum as no , p.*  from (select * from product order by date desc)p  limit ?,?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			System.out.println(start);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setAge(rs.getInt("age"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setFilename(rs.getString("filename"));
				bean.setEvent(rs.getString("event"));
				bean.setGender(rs.getString("gender"));
				bean.setInventory(rs.getInt("inventory"));
				bean.setName(rs.getString("name"));
				bean.setNum(rs.getInt("num"));
				bean.setPrice(rs.getInt("price"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setSell(rs.getInt("sell"));
				bean.setFilename1(rs.getString("filename1"));
				bean.setFilename2(rs.getString("filename2"));
				
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

	private int getReadcount(int num) {  //readcount 증가

		try {
			getConnection();
			String sql = "select readcount from product where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				sql = "update product set readcount=? where num=?";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, rs.getInt(1) + 1);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();

				return rs.getInt(1) + 1;
			}
			con.close();
		} catch (Exception e) {
			System.out.println("getReadCount Error" + e);
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

	public ProductBean getDetail(int num) { // 상품 상세정보 얻기
		ProductBean bean = new ProductBean();
		int count = getReadcount(num);
		try {
			getConnection();
			String sql = "select * from product where num=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setAge(rs.getInt("age"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setFilename(rs.getString("filename"));
				bean.setEvent(rs.getString("event"));
				bean.setGender(rs.getString("gender"));
				bean.setInventory(rs.getInt("inventory"));
				bean.setName(rs.getString("name"));
				bean.setNum(rs.getInt("num"));
				bean.setPrice(rs.getInt("price"));
				bean.setReadcount(count);
				bean.setSell(rs.getInt("sell"));
				bean.setFilename1(rs.getString("filename1"));
				bean.setFilename2(rs.getString("filename2"));
			}

		} catch (Exception e) {
			System.out.println("getDetail error");
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
		return bean;
	}

	public Vector<ProductBean> getProductList(String event, String gender, int age, int price) { 

		Vector<ProductBean> v = new Vector<ProductBean>();

		ProductBean pbean = null;

		try {
			
			getConnection();
		
			String sql = "SELECT * FROM product WHERE event like '%" + event
					+ "%' and age =? and gender = ? and price >= ? and price < ?+10000";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, age);
			pstmt.setString(2, gender);
			pstmt.setInt(3, price);
			pstmt.setInt(4, price);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pbean = new ProductBean();
				pbean.setAge(rs.getInt("age"));
				pbean.setContent(rs.getString("content"));
				pbean.setDate(rs.getTimestamp("date"));
				pbean.setFilename(rs.getString("filename"));
				pbean.setEvent(rs.getString("event"));
				pbean.setGender(rs.getString("gender"));
				pbean.setInventory(rs.getInt("inventory"));
				pbean.setName(rs.getString("name"));
				pbean.setNum(rs.getInt("num"));
				pbean.setPrice(rs.getInt("price"));
				pbean.setReadcount(rs.getInt("readcount"));
				pbean.setSell(rs.getInt("sell"));
				pbean.setFilename1(rs.getString("filename1"));
				pbean.setFilename2(rs.getString("filename2"));

				
				v.add(pbean);
			}
			
			con.close();

		} catch (Exception err) {
			err.printStackTrace();
		}
		return v; 
	}
	
	public List<ProductBean> getListGoods(String name) {
		   
		   List<ProductBean> list = new ArrayList<ProductBean>();

		   try {
		      getConnection();

		      String sql = "select * from product where name like '%" + name + "%'";

		      pstmt = con.prepareStatement(sql);
		      rs = pstmt.executeQuery();

		      while (rs.next()) {
		         ProductBean bean = new ProductBean();

		         bean.setAge(rs.getInt("age"));
		         bean.setContent(rs.getString("content"));
		         bean.setDate(rs.getTimestamp("date"));
		         bean.setFilename(rs.getString("filename"));
		         bean.setEvent(rs.getString("event"));
		         bean.setGender(rs.getString("gender"));
		         bean.setInventory(rs.getInt("inventory"));
		         bean.setName(rs.getString("name"));
		         bean.setNum(rs.getInt("num"));
		         bean.setPrice(rs.getInt("price"));
		         bean.setReadcount(rs.getInt("readcount"));
		         bean.setSell(rs.getInt("sell"));

		         list.add(bean);
		      }

		      con.close();
		      pstmt.close();
		      rs.close();
		   } catch (Exception e) {
		      System.out.println("getlist error");
		   }

		   return list;
	}
	
	// 삭제
		public void delProduct(int num) {

			try {
				getConnection();
				String sql = "delete from product where num=?";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, num);

				pstmt.executeUpdate();

				con.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println("del error");
			}

		}

		public int TotalProduct() {
			int total;
			try {
				getConnection();
				String sql = "select count(num) from product";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1);
				}
				con.close();
			} catch (Exception e) {
				System.out.println("TotalProduct error");
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

		public void updatePro(int num, ProductBean productBean) {
			try {
				getConnection();
				String sql = "update product set name=?,price=?,event=?,gender=?,age=?,inventory=?,content=?,filename=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, productBean.getName());
				pstmt.setInt(2, productBean.getPrice());
				pstmt.setString(3, productBean.getEvent());
				pstmt.setString(4, productBean.getGender());
				pstmt.setInt(5, productBean.getAge());
				pstmt.setInt(6, productBean.getInventory());
				pstmt.setString(7, productBean.getContent());
				pstmt.setString(8, productBean.getFilename());
				pstmt.setInt(9, num);

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

		public List<ProductBean> getTopPro() {
			List<ProductBean> list = new ArrayList<ProductBean>();
			try {
				getConnection();
				String sql = "select @rownum:=@rownum as no , p.*  from (select * from product order by readcount desc)p  limit 0,3";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ProductBean bean = new ProductBean();
					
					bean.setName(rs.getString("name"));
					bean.setFilename(rs.getString("filename"));
					bean.setPrice(rs.getInt("price"));
					bean.setNum(rs.getInt("num"));
					bean.setEvent(rs.getString("event"));
					System.out.println(bean.getNum());
					list.add(bean);
				}
				return list;
			} catch (Exception e) {
				System.out.println("TopProduct error");
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return null;
		}

		public ProductBean getPro(String filename) {
			ProductBean bean = new ProductBean();
			try {
				getConnection();
				String sql = "select * from product where filename=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, filename);
				rs = pstmt.executeQuery();
				if(rs.next()){
				
					bean.setAge(rs.getInt("age"));
					bean.setContent(rs.getString("content"));
					bean.setDate(rs.getTimestamp("date"));
					bean.setFilename(rs.getString("filename"));
					bean.setEvent(rs.getString("event"));
					bean.setGender(rs.getString("gender"));
					bean.setInventory(rs.getInt("inventory"));
					bean.setName(rs.getString("name"));
					bean.setNum(rs.getInt("num"));
					bean.setPrice(rs.getInt("price"));
					bean.setReadcount(rs.getInt("readcount"));
					bean.setSell(rs.getInt("sell"));
					bean.setFilename1(rs.getString("filename1"));
					bean.setFilename2(rs.getString("filename2"));
				}
				
			} catch (Exception e) {
				System.out.println("getPro error");
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return bean;
		}
			
		
		public List<ProductBean> getListDate() {
			   
			   List<ProductBean> list = new ArrayList<ProductBean>();

			   try {
			      getConnection();

			      String sql = "select * from product order by date desc";

			      pstmt = con.prepareStatement(sql);
			      rs = pstmt.executeQuery();

			      while (rs.next()) {
			         ProductBean bean = new ProductBean();

			         bean.setAge(rs.getInt("age"));
			         bean.setContent(rs.getString("content"));
			         bean.setDate(rs.getTimestamp("date"));
			         bean.setFilename(rs.getString("filename"));
			         bean.setEvent(rs.getString("event"));
			         bean.setGender(rs.getString("gender"));
			         bean.setInventory(rs.getInt("inventory"));
			         bean.setName(rs.getString("name"));
			         bean.setNum(rs.getInt("num"));
			         bean.setPrice(rs.getInt("price"));
			         bean.setReadcount(rs.getInt("readcount"));
			         bean.setSell(rs.getInt("sell"));
			         bean.setReview_count(rs.getInt("review_count"));

			         list.add(bean);
			      }

			      con.close();
			      pstmt.close();
			      rs.close();
			   } catch (Exception e) {
			      System.out.println("getDatelist error");
			   }

			   return list;


		}
		public List<ProductBean> getListReview_count() {
			   
			   List<ProductBean> list = new ArrayList<ProductBean>();

			   try {
			      getConnection();

			      String sql = "select * from product order by review_count desc";

			      pstmt = con.prepareStatement(sql);
			      rs = pstmt.executeQuery();

			      while (rs.next()) {
			         ProductBean bean = new ProductBean();

			         bean.setAge(rs.getInt("age"));
			         bean.setContent(rs.getString("content"));
			         bean.setDate(rs.getTimestamp("date"));
			         bean.setFilename(rs.getString("filename"));
			         bean.setEvent(rs.getString("event"));
			         bean.setGender(rs.getString("gender"));
			         bean.setInventory(rs.getInt("inventory"));
			         bean.setName(rs.getString("name"));
			         bean.setNum(rs.getInt("num"));
			         bean.setPrice(rs.getInt("price"));
			         bean.setReadcount(rs.getInt("readcount"));
			         bean.setSell(rs.getInt("sell"));
			         bean.setReview_count(rs.getInt("review_count"));

			         list.add(bean);
			      }

			      con.close();
			      pstmt.close();
			      rs.close();
			   } catch (Exception e) {
			      System.out.println("getDatelist error");
			   }

			   return list;
		}
		public List<ProductBean> getListPop_count() {
			   
			   List<ProductBean> list = new ArrayList<ProductBean>();

			   try {
			      getConnection();

			      String sql = "select * from product order by sell desc";

			      pstmt = con.prepareStatement(sql);
			      rs = pstmt.executeQuery();

			      while (rs.next()) {
			         ProductBean bean = new ProductBean();

			         bean.setAge(rs.getInt("age"));
			         bean.setContent(rs.getString("content"));
			         bean.setDate(rs.getTimestamp("date"));
			         bean.setFilename(rs.getString("filename"));
			         bean.setEvent(rs.getString("event"));
			         bean.setGender(rs.getString("gender"));
			         bean.setInventory(rs.getInt("inventory"));
			         bean.setName(rs.getString("name"));
			         bean.setNum(rs.getInt("num"));
			         bean.setPrice(rs.getInt("price"));
			         bean.setReadcount(rs.getInt("readcount"));
			         bean.setSell(rs.getInt("sell"));
			         bean.setReview_count(rs.getInt("review_count"));

			         list.add(bean);
			      }

			      con.close();
			      pstmt.close();
			      rs.close();
			   } catch (Exception e) {
			      System.out.println("getListPop_list error");
			   }

			   return list;
		}
		
		public List<ProductBean> event_p(int startRow, int pageSize,String event) {
			List<ProductBean> list_e = new ArrayList<ProductBean>();

			try {
				getConnection();

				String sql = "select * from product where event like '" + event + "' limit ?,?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				

				while (rs.next()) {
					ProductBean bean = new ProductBean();

					 bean.setAge(rs.getInt("age"));
			         bean.setContent(rs.getString("content"));
			         bean.setDate(rs.getTimestamp("date"));
			         bean.setFilename(rs.getString("filename"));
			         bean.setEvent(rs.getString("event"));
			         bean.setGender(rs.getString("gender"));
			         bean.setInventory(rs.getInt("inventory"));
			         bean.setName(rs.getString("name"));
			         bean.setNum(rs.getInt("num"));
			         bean.setPrice(rs.getInt("price"));
			         bean.setReadcount(rs.getInt("readcount"));
			         bean.setSell(rs.getInt("sell"));
			         bean.setReview_count(rs.getInt("review_count"));
					list_e.add(bean);
				}

		
			}  catch (Exception err) {
		         System.out.println("list_e : " + err);
		      } finally {
		         try {
		            if (con != null) {con.close();}
		            if (pstmt != null) {pstmt.close();}
		            if (rs != null) {rs.close();}
		         } catch (SQLException err) {
		            err.printStackTrace();
		         }
		      }

			return list_e;
		}
		
		/* 리뷰순 정렬을 위해 포토리뷰나 일반리뷰가 추가되면 review_count가 +1증가  */
		public void upReview(int num) {
			String sql = "";
			try {
				getConnection();
				sql = "update product set review_count=review_count+1 where num=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.executeUpdate();

			}  catch (Exception err) {
		         System.out.println("updateReview_count : " + err);
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

		
	/* 리뷰순 정렬을 위해 포토리뷰나 일반리뷰가 삭제되면 review_count가 -1감소  */	
		public void delReview_count(int num) {
			String sql = "";
			try {
				getConnection();
				sql = "update product set review_count=review_count-1 where num=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.executeUpdate();

			}  catch (Exception err) {
		         System.out.println("delReview_count : " + err);
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
		
		 public int getCommentCount_e(String event) {
		      con = null;
		      pstmt = null;
		      rs = null;
		      String sql = "";
		      int count_e = 0;

		      try {
		         getConnection();
		         sql = "select count(*) from product where event like '" + event + "'";
		         pstmt = con.prepareStatement(sql);

		
		         rs = pstmt.executeQuery();

		         if (rs.next()) {
		            count_e = rs.getInt(1);
		         }
		         
		      } catch (Exception err) {
		         System.out.println("getCommentCount_e에서 오류 : " + err);
		      } finally {
		         try {
		            if (con != null) {con.close();}
		            if (pstmt != null) {pstmt.close();}
		            if (rs != null) {rs.close();}
		         } catch (SQLException err) {
		            err.printStackTrace();
		         }
		      }
		      return count_e;

		   }
		 
		 
			public int updateInventory(int sell, int num) {
				int result = 0;
				String sql = "";
				int inventory = 0;
				int _sell = 0;
				try {
					 getConnection();
					 //먼저 검색하고 
					 sql = "select inventory,sell from product where num = ?";
					 pstmt = con.prepareStatement(sql);
					 pstmt.setInt(1, num);
					 rs = pstmt.executeQuery();
					 if(rs.next()) {
						 inventory =  rs.getInt("inventory");
						 _sell = rs.getInt("sell");
					 }
					 pstmt.close();
					 rs.close();
					 sql = "update product set inventory = ?, sell = ? where num = ?";
					 pstmt = con.prepareStatement(sql);
					 pstmt.setInt(1, inventory-sell);
					 pstmt.setInt(2, _sell+sell);
					 pstmt.setInt(3, num);
					 result = pstmt.executeUpdate();
					 if(pstmt != null) {pstmt.close();}
					 if(con != null) {con.close();}
				} catch (Exception e) {
					System.out.println("updateInventory()메소드에서 발생한 에러 입니다.");
					e.printStackTrace();
				}
				return result;
			}
			
			
			public int updateInventory2(int sell, String productName) {
				int result = 0;
				String sql = "";
				int inventory = 0;
				int _sell = 0;
				try {
					getConnection();
					sql = "select inventory,sell from product where name = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, productName);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						 inventory =  rs.getInt("inventory");
						 _sell = rs.getInt("sell");
					}
					pstmt.close();
					rs.close();
					sql = "update product set inventory = ?, sell = ? where name = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, inventory-sell);
					pstmt.setInt(2, _sell+sell);
					pstmt.setString(3, productName);
					result = pstmt.executeUpdate();
					if(pstmt != null) {pstmt.close();}
					if(con != null) {con.close();}
					
					
				} catch (Exception e) {
					System.out.println("updateInventory2에서 발생한 에러 입니다.");
					e.printStackTrace();
				}
				
				return result;
			}
		 
		 
		 
		 
}