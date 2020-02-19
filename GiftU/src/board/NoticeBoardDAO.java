package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeBoardDAO {

	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}// getConnection()

	public List<NoticeBoardBean> getNoticeList(int startRow, int pageSize, String text) { //게시판 메인 화면에서 리스트를 뽑아줌

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		List<NoticeBoardBean> noticeList = new ArrayList<NoticeBoardBean>();

		try {
			con = getConnection();
			
			if (text == null || text.isEmpty()) {
				sql = "select * from notice order by num desc limit ?,?";
				// 검색 있으면
			} else {
				sql = "select * from notice where"
						+ " subject like '%" + text + "%' or message like '%" + text + "%'"
						+ " order by num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeBoardBean NBean = new NoticeBoardBean();

				NBean.setNum(rs.getInt("num"));
				NBean.setSubject(rs.getString("subject"));
				NBean.setMessage(rs.getString("message"));
				NBean.setFile(rs.getString("file"));
				NBean.setReadcount(rs.getInt("readcount"));
				NBean.setDate(rs.getTimestamp("date"));
				NBean.setMulti(rs.getInt("multi"));
				NBean.setBanner(rs.getString("banner"));
				NBean.setCoupon(rs.getString("coupon"));
				
				noticeList.add(NBean);
			}
		} catch (Exception err) {
			System.out.println("getNoticeList에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return noticeList;
	}//게시판 메인 화면에서 리스트를 뽑아줌

	
	public int getNoticeCount() { //게시물의 갯수
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = getConnection();
			sql = "select count(*) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception err) {
			System.out.println("getNoticeCount에서 오류 : " + err);
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

	}//게시물의 갯수

	public NoticeBoardBean getNotice(int num) { //하나의 게시물 불러오기

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		NoticeBoardBean nBean = null;

		try {
			con = getConnection();
			sql = "select * from notice where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				nBean = new NoticeBoardBean();

				nBean.setNum(rs.getInt("num"));
				nBean.setSubject(rs.getString("subject"));
				nBean.setMessage(rs.getString("message"));
				nBean.setFile(rs.getString("file"));
				nBean.setReadcount(rs.getInt("readcount"));
				nBean.setDate(rs.getTimestamp("date"));
				nBean.setMulti(rs.getInt("multi"));
				nBean.setBanner(rs.getString("banner"));
				nBean.setCoupon(rs.getString("coupon"));
			}
		} catch (Exception err) {
			System.out.println("getNotice에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return nBean;
	}//하나의 게시물 불러오기

	// 조회수 올림
	public void updateReadCount(int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "update notice set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception err) {

			System.out.println("updateReadCount에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}

	}//조회수 올림
	
	//게시물 추가
	public int insertNotice(NoticeBoardBean nBean) { //게시물 추가

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0;

		try {
			sql = "select max(num) from notice";
			con = getConnection();

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			// insert SQL
			sql = "insert into notice(num,subject,message,file,readcount,date,multi,banner,coupon) values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, nBean.getSubject());
			pstmt.setString(3, nBean.getMessage());
			pstmt.setString(4, nBean.getFile());
			pstmt.setInt(5, 0);
			pstmt.setTimestamp(6, nBean.getDate());
			pstmt.setInt(7, nBean.getMulti());
			pstmt.setString(8, nBean.getBanner());
			pstmt.setString(9, nBean.getCoupon());
			
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("insertNotice에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return num;
	}//게시물 추가
		
	//게시물 수정
	public void updateNotice(NoticeBoardBean nBean) {//게시물 수정
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			sql = "update notice set subject=?, message=?, file=?, multi=?, banner=?, coupon=? where num=?";
			con = getConnection();
			// 먼저 ~~ 게시판에 글을 추가하기 전에 게시판에 저장되어 있는 최신 글번호를 알아야?
			// 새로 추가 할 글번호를 만들 수 있다
			// board테이블에 저장되어 있는 최신 글num을 검색하여 얻기
			pstmt = con.prepareStatement(sql);
			// 매개변수로 전달 받은 삭제할 글 번호에 해당하는 글 삭제

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nBean.getSubject());
			pstmt.setString(2, nBean.getMessage());
			pstmt.setString(3, nBean.getFile());
			pstmt.setInt(4, nBean.getMulti());
			pstmt.setString(5, nBean.getBanner());
			pstmt.setString(6, nBean.getCoupon());
			pstmt.setInt(7, nBean.getNum());
			pstmt.executeUpdate();// update 실행

		} catch (Exception err) {
			System.out.println("updateNotice에서 오류 발생 : " + err);
		} finally {
				try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}//게시물 수정
	
	// 게시물 삭제
	public void deleteNotice(int num) {// 게시물 삭제

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();

			sql = "delete from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();// delete 실행

		} catch (Exception err) {
			System.out.println("deleteNotice에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}//게시물 삭제
	
	//////////////////////////////////////////////////////////////////공지나 이벤트만 따로 보기 위한 구문
	public List<NoticeBoardBean> getEventList(int startRow, int pageSize, String text, int a) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		List<NoticeBoardBean> noticeList = new ArrayList<NoticeBoardBean>();

		try {
			con = getConnection();
			
			if (text == null || text.isEmpty()) {
				sql = "select * from notice where multi=? order by num desc limit ?,?";
				// 검색 있으면
			} else {
				sql = "select * from notice where multi=? and"
						+ " (subject like '%" + text + "%' or message like '%" + text + "%'"
						+ ") order by num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeBoardBean NBean = new NoticeBoardBean();

				NBean.setNum(rs.getInt("num"));
				NBean.setSubject(rs.getString("subject"));
				NBean.setMessage(rs.getString("message"));
				NBean.setFile(rs.getString("file"));
				NBean.setReadcount(rs.getInt("readcount"));
				NBean.setDate(rs.getTimestamp("date"));
				NBean.setMulti(rs.getInt("multi"));
				NBean.setBanner(rs.getString("banner"));
				NBean.setCoupon(rs.getString("coupon"));

				noticeList.add(NBean);
			}
		} catch (Exception err) {
			System.out.println("getNoticeList : " + err);
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return noticeList;
	}

	// 게시물이 몇개냐 이놈
	public int getEventCount(String text, int a) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = getConnection();
			
			if (text == null || text.isEmpty()) {
				sql = "select count(*) from notice where multi= ?";
			}
			// 검색 있으면
			else{
				sql = "select count(*) from notice where multi= ? and"
					+ " (subject like '%" + text + "%' or message like '%" + text + "%')";
			}
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, a);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception err) {
			System.out.println("getNoticeCount에서 오류 : " + err);
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
	/////////////////////////////////////////////////////////////////////////////////

}
