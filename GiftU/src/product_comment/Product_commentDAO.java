package product_comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;


public class Product_commentDAO {

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

	private int getNum() {
		String sql = "";

		try {
			getConnection();
			sql = "select max(num_c) from product_comment";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/* 일반 리뷰 추가 */
	  public void addComment(Product_commentBean cbean) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int num_c = 0;

	      try {
	         sql = "select max(num_c) from product_comment";
	         getConnection();

	         pstmt = con.prepareStatement(sql);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            num_c = rs.getInt(1) + 1;
	         } else {
	            num_c = 1;
	         }

	         // insert SQL
	         sql = "insert ignore product_comment(num_c,name,content,date,num,ref,lev,seq,comment_num,filename,starcount)"
	            + " values(?,?,?,?,(select num from product where num=?),?,?,?,?,?,?)";

	         pstmt = con.prepareStatement(sql);

	         pstmt.setInt(1, num_c);
	         pstmt.setString(2, cbean.getName());
	         pstmt.setString(3, cbean.getContent());
	         pstmt.setTimestamp(4, cbean.getDate());
	         pstmt.setInt(5, cbean.getNum());
	         pstmt.setInt(6, num_c);
	         pstmt.setInt(7, 0);
	         pstmt.setInt(8, 0);
	         pstmt.setInt(9, cbean.getComment_num());
	         pstmt.setString(10, cbean.getFilename());
	         pstmt.setInt(11,0);
	         
	         pstmt.executeUpdate();

	      } catch (Exception err) {
	         System.out.println("insertcomment : " + err);
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
	  
	/* 포토 리뷰 추가 */	  
	  public void addComment_r(Product_commentBean cbean) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int num_c = 0;

	      try {
	         sql = "select max(num_c) from product_comment";
	         getConnection();

	         pstmt = con.prepareStatement(sql);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            num_c = rs.getInt(1) + 1;
	         } else {
	            num_c = 1;
	         }

	         // insert SQL
	         sql = "insert ignore product_comment(num_c,name,content,date,num,ref,lev,seq,comment_num,filename,starcount)"
	            + " values(?,?,?,?,(select num from product where num=?),?,?,?,?,?,?)";

	         pstmt = con.prepareStatement(sql);

	         pstmt.setInt(1, num_c);
	         pstmt.setString(2, cbean.getName());
	         pstmt.setString(3, cbean.getContent());
	         pstmt.setTimestamp(4, cbean.getDate());
	         pstmt.setInt(5, cbean.getNum());
	         pstmt.setInt(6, num_c);
	         pstmt.setInt(7, 0);
	         pstmt.setInt(8, 0); 
	         pstmt.setInt(9, cbean.getComment_num());  
	         pstmt.setString(10, cbean.getFilename());
	         pstmt.setInt(11,cbean.getStarcount());
	         
	         pstmt.executeUpdate();

	      } catch (Exception err) {
	         System.out.println("insertcomment : " + err);
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
	  
	/* 일반 리뷰 갯수 */
	  public int getCommentCount(int num) {
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int count = 0;

	      try {
	         getConnection();
	         sql = "select count(*) from product_comment c join product p on (c.num=p.num) where p.num=? and seq=0 and comment_num=1";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            count = rs.getInt(1);
	         }
	         
	      } catch (Exception err) {
	         System.out.println("getCommentCount에서 오류 : " + err);
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
	  
		/* 포토 리뷰 갯수*/
	  public int getCommentCount_r(int num) {
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int count_r = 0;

	      try {
	         getConnection();
	         sql = "select count(*) from product_comment c join product p on (c.num=p.num) where p.num=? and seq=0 and comment_num=2";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            count_r = rs.getInt(1);
	         }
	         
	      } catch (Exception err) {
	         System.out.println("getCommentCount_r에서 오류 : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return count_r;

	   }
	  
	/* 관리자가 댓글을 남긴 일반리뷰의 갯수 */
	  public int getCommentCount_c(int num) {
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int count_c = 0;

	      try {
	         getConnection();
	         sql = "select count(*) from product_comment where p.num=? and seq>0 and comment_num=1";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            count_c = rs.getInt(1);
	         }
	         
	      } catch (Exception err) {
	         System.out.println("getCommentCount_c에서 오류 : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return count_c;

	   }

	/* 포토리뷰 별점합 */ 
	  public int getSumstar(int num) {
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      int star = 0;

	      try {
	         getConnection();
	         sql = "select sum(starcount) from product_comment c join product p on (c.num=p.num) where p.num=? and seq=0 and comment_num=2";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            star = rs.getInt(1);
	         }
	         
	      } catch (Exception err) {
	         System.out.println("getSumstar에서 오류 : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return star;

	   }
	  
	  
	/* 일반 리뷰 list */	
	  public List<Product_commentBean> getCommentList(int startRow, int pageSize,int num) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      List<Product_commentBean> clist = new ArrayList<Product_commentBean>();

	      try {
	         getConnection();
	
	         sql = "select * from product_comment c join product p on (c.num=p.num) where p.num=? and seq=0 and comment_num=1 order by c.num_c desc limit ?,?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, pageSize);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {

	        	Product_commentBean cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            
	            clist.add(cBean);
	         }
	      } catch (Exception err) {
	         System.out.println("getCommentList : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return clist;
	   }// getteamboardList
	  
	/* 포토리뷰 list */
	  public List<Product_commentBean> getCommentList_r(int startRow, int pageSize,int num) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      List<Product_commentBean> clist_r = new ArrayList<Product_commentBean>();

	      try {
	         getConnection();
	
	         sql = "select * from product_comment c join product p on (c.num=p.num) where p.num=? and seq=0 and comment_num=2 order by c.num_c desc limit ?,?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, pageSize);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {

	        	Product_commentBean cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            clist_r.add(cBean);
	         }
	      } catch (Exception err) {
	         System.out.println("getCommentList_r : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return clist_r;
	   }

	  
	/* 관리자가 남긴 댓글을 포함하는 일반리뷰의 list */ 
	  public List<Product_commentBean> getCommentList_c(int num) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      List<Product_commentBean> list_c = new ArrayList<Product_commentBean>();

	      try {
	         getConnection();
	
	         sql = "select * from product_comment where num=? and seq>0";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {

	        	Product_commentBean cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            
	            list_c.add(cBean);
	         }
	      } catch (Exception err) {
	         System.out.println("getCommentList : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return list_c;
	   }
	  
	  /* 관리자가 남긴 댓글을 포함하는 포토리뷰의 list */
	  public List<Product_commentBean> getCommentList_d(int num) {

	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      List<Product_commentBean> list_d = new ArrayList<Product_commentBean>();

	      try {
	         getConnection();
	
	         sql = "select * from product_comment where num=? and seq>0";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {

	        	Product_commentBean cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            
	            list_d.add(cBean);
	         }
	      } catch (Exception err) {
	         System.out.println("getCommentList : " + err);
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return list_d;
	   }

	  public Product_commentBean getComment(int num,int num_c){
	      
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      Product_commentBean cBean = null;

	      try {
	         getConnection();
	         sql = "select * from product_comment where num = ? and num_c=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, num_c);
	         rs = pstmt.executeQuery();

	         if(rs.next()){
	            
	            cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            
	         }
	      } catch (Exception err) {
	         System.out.println("getComment : " + err);
	         
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return cBean;
	   }
	   
	  
	  public Product_commentBean getReview(int num,int num_c){
	      
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";
	      Product_commentBean cBean = null;

	      try {
	         getConnection();
	         sql = "select * from product_comment where num = ? and num_c=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, num_c);
	         rs = pstmt.executeQuery();

	         if(rs.next()){
	            
	            cBean = new Product_commentBean();
	            cBean.setDate(rs.getTimestamp("date"));
	            cBean.setName(rs.getString("name"));
	            cBean.setNum_c(rs.getInt("num_c"));
	            cBean.setRef(rs.getInt("ref"));
	            cBean.setNum(rs.getInt("num"));
	            cBean.setContent(rs.getString("content"));
	            cBean.setLev(rs.getInt("lev"));
	            cBean.setSeq(rs.getInt("seq"));
	            cBean.setComment_num(rs.getInt("comment_num"));
	            cBean.setFilename(rs.getString("filename"));
	            cBean.setStarcount(rs.getInt("starcount"));
	            
	         }
	      } catch (Exception err) {
	         System.out.println("getReview : " + err);
	         
	      } finally {
	         try {
	            if (con != null) {con.close();}
	            if (pstmt != null) {pstmt.close();}
	            if (rs != null) {rs.close();}
	         } catch (SQLException err) {
	            err.printStackTrace();
	         }
	      }
	      return cBean;
	   }
	  
	  //일반댓글 수정
	  public void updateComment(Product_commentBean cbean,int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "update product_comment set content=? , date=? where num_c=? and num=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, cbean.getContent());
	         pstmt.setTimestamp(2, cbean.getDate());
	         pstmt.setInt(3,num_c);
	         pstmt.setInt(4, num);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("updateReview에서 오류 발생 : " + err);
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
	  
	  //일반 리뷰 삭제
	  public void delComment(int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "delete from product_comment where num=? and num_c=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	   
	         pstmt.setInt(1,num);
	         pstmt.setInt(2,num_c);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("delReview에서 오류 발생 : " + err);
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
	  
	  //포토리뷰 수정
	  public void updateReview(Product_commentBean cbean,int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "update product_comment set content=? , date=?, filename=? ,starcount=? where num_c=? and num=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, cbean.getContent());
	         pstmt.setTimestamp(2, cbean.getDate());
	         pstmt.setString(3, cbean.getFilename());
	         pstmt.setInt(4, cbean.getStarcount());
	         pstmt.setInt(5,num_c);
	         pstmt.setInt(6, num);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("updateReview에서 오류 발생 : " + err);
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
	  
	  //포토리뷰 삭제
	  public void delReview(int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "delete from product_comment where num=? and num_c=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	   
	         pstmt.setInt(1,num);
	         pstmt.setInt(2,num_c);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("delReview에서 오류 발생 : " + err);
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
	 
	  //관리자가 남긴 일반리뷰의 댓글 삭제
	  public void delReview_m(int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "delete from product_comment where num=? and num_c=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	   
	         pstmt.setInt(1,num);
	         pstmt.setInt(2,num_c);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("delReview_m에서 오류 발생 : " + err);
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
	  
	  //관리자가 남긴 포토리뷰의 댓글 삭제
	  public void delReview_d(int num,int num_c){
	      con = null;
	      pstmt = null;
	      rs = null;
	      String sql = "";

	      try {
	    	  getConnection();
	    	  sql = "delete from product_comment where num=? and num_c=?";
	        
	        
	         pstmt = con.prepareStatement(sql);
	   
	         pstmt.setInt(1,num);
	         pstmt.setInt(2,num_c);
	               
	         pstmt.executeUpdate();//update 실행

	      } catch (Exception err) {
	         System.out.println("delReview_d에서 오류 발생 : " + err);
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
	  
	  

	  public void reInsertComment(Product_commentBean cbean){		
			con = null;
			pstmt = null;
			rs = null;
			String sql = "";

			int num_c = 0;		
			try {
				//커넥션풀로 부터 커넥션 얻기
				getConnection();
				sql = "select max(num_c) from product_comment";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){//글번호 검색이 되면
		
					num_c = rs.getInt(1) + 1;
				}else{//최신 글번호가 검색 되지 않으면 
			
					num_c = 1;
				}
		
				sql = "insert ignore product_comment(num_c,name,content,date,num,ref,lev,seq,comment_num,filename,starcount)"
			            + " values(?,?,?,?,(select num from product where num=?),?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num_c);//답변글 글번호 
				pstmt.setString(2, cbean.getName());
				pstmt.setString(3, cbean.getContent());
				pstmt.setTimestamp(4, cbean.getDate());
				pstmt.setInt(5, cbean.getNum());//답변글 내용
				pstmt.setInt(6, num_c);//답변글의 group값은 부모글의 group값을 사용하여 INSERT
				pstmt.setInt(7, 1);//답변글의 들여쓰기 정도값은? 											  
				pstmt.setInt(8, cbean.getNum_c());//답변글들 내의 순서 값은 부모글의 순서값에 + 1한값을 사용
				pstmt.setInt(9, cbean.getComment_num());
				pstmt.setString(10, "ddd.gif");
				pstmt.setInt(11, 0);

				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					//자원해제
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}//finally 끝	
			
		}
		
	  
	  public void reInsertReview(Product_commentBean cbean){		
			con = null;
			pstmt = null;
			rs = null;
			String sql = "";
			//DB에 추가할 답변글번호를 저장할 변수 선언
			int num_c = 0;		
			try {
				//커넥션풀로 부터 커넥션 얻기
				getConnection();
				sql = "select max(num_c) from product_comment";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){//글번호 검색이 되면
		
					num_c = rs.getInt(1) + 1;
				}else{//최신 글번호가 검색 되지 않으면 
			
					num_c = 1;
				}
		
				sql = "insert ignore product_comment(num_c,name,content,date,num,ref,lev,seq,comment_num,filename,starcount)"
			            + " values(?,?,?,?,(select num from product where num=?),?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num_c);//답변글 글번호 
				pstmt.setString(2, cbean.getName());
				pstmt.setString(3, cbean.getContent());
				pstmt.setTimestamp(4, cbean.getDate());
				pstmt.setInt(5, cbean.getNum());//답변글 내용
				pstmt.setInt(6, num_c);//답변글의 group값은 부모글의 group값을 사용하여 INSERT
				pstmt.setInt(7, 1);//답변글의 들여쓰기 정도값은? 											  
				pstmt.setInt(8, cbean.getNum_c());//답변글들 내의 순서 값은 부모글의 순서값에 + 1한값을 사용
				pstmt.setInt(9, cbean.getComment_num());
				pstmt.setString(10, "ddd.gif");
				pstmt.setInt(11, 0);

				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					//자원해제
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}//finally 끝	
			
		}//reInsertBoard() 
	  
	  
	  //상품삭제시 포함된 모든 리뷰삭제
	  public void delComment_all(int num) {
			String sql = "";
			try {
				getConnection();

				sql = "delete from product_comment where num=?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();

			}  catch (Exception err) {
		         System.out.println("delComment_all : " + err);
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
	  
	  /* 리뷰삭제시 관리자가 남긴 댓글 함께 삭제 */
	  public void delComment_double(int num,int num_c) {
			String sql = "";
			try {
				getConnection();

				sql = "delete from product_comment where num=? and seq=?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, num_c);
				pstmt.executeUpdate();

			}  catch (Exception err) {
		         System.out.println("delComment_double : " + err);
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