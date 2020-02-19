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

public class BoardDAO {

	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();

		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		con = ds.getConnection();

		return con;
	}// getConnection()

	// 게시물 1개 보기
	public BoardBean getBoard(int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BoardBean bBean = null;

		try {
			con = getConnection();
			sql = "select * from qna where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				bBean = new BoardBean();
				bBean.setMessage(rs.getString("message"));
				bBean.setDate(rs.getTimestamp("date"));
				bBean.setEmail(rs.getString("Email"));
				bBean.setIp(rs.getString("ip"));
				bBean.setName(rs.getString("name"));
				bBean.setNum(rs.getInt("num"));
				bBean.setReadcount(rs.getInt("readcount"));
				bBean.setSubject(rs.getString("subject"));
				bBean.setSecret(rs.getInt("secret"));
				bBean.setAnswer(rs.getString("answer"));
			}
		} catch (Exception err) {
			System.out.println("getBoard : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return bBean;
	}

	// 삭제
	public void deleteBoard(int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			// 먼저 ~~ 게시판에 글을 추가하기 전에 게시판에 저장되어 있는 최신 글번호를 알아야?
			// 새로 추가 할 글번호를 만들 수 있다
			// board테이블에 저장되어 있는 최신 글num을 검색하여 얻기

			// 매개변수로 전달 받은 삭제할 글 번호에 해당하는 글 삭제
			sql = "delete from qna where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();// delete 실행

		} catch (Exception err) {
			System.out.println("insertBoard에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}// deleteBoard메소드 끝

	public void updateBoard(BoardBean bBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			sql = "update qna set subject=?, message=? where num=?";
			con = getConnection();
			// 먼저 ~~ 게시판에 글을 추가하기 전에 게시판에 저장되어 있는 최신 글번호를 알아야?
			// 새로 추가 할 글번호를 만들 수 있다
			// board테이블에 저장되어 있는 최신 글num을 검색하여 얻기
			pstmt = con.prepareStatement(sql);
			// 매개변수로 전달 받은 삭제할 글 번호에 해당하는 글 삭제

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bBean.getSubject());
			pstmt.setString(2, bBean.getMessage());
			pstmt.setInt(3, bBean.getNum());

			pstmt.executeUpdate();// update 실행

		} catch (Exception err) {
			System.out.println("updateBoard에서 오류 발생 : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}// updateBoard메소드 끝

	// 조회수 올림
	public void updateReadCount(int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = getConnection();
			sql = "update qna set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception err) {

			System.out.println("updateReadCount : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}

	}// updateReadCount

	// 게시판에 게시물 목록 보여줌

	public List<BoardBean> getBoardList(int startRow, int pageSize, String text) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		List<BoardBean> qnaList = new ArrayList<BoardBean>();

		try {
			con = getConnection();
			// 검색 없으면
			if (text == null || text.isEmpty()) {
				sql = "select * from qna order by num desc limit ?,?";
				// 검색 있으면
			} else {
				sql = "select * from qna where"
						+ " name like '%" + text + "%' or subject like '%" + text + "%'"
						+ " or message like '%" + text + "%' order by num desc limit ?,?";
			}

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				BoardBean bBean = new BoardBean();
				bBean.setMessage(rs.getString("message"));
				bBean.setDate(rs.getTimestamp("date"));
				bBean.setEmail(rs.getString("Email"));
				bBean.setIp(rs.getString("ip"));
				bBean.setName(rs.getString("name"));
				bBean.setNum(rs.getInt("num"));
				bBean.setReadcount(rs.getInt("readcount"));
				bBean.setSubject(rs.getString("subject"));
				bBean.setSecret(rs.getInt("secret"));
				bBean.setAnswer(rs.getString("answer"));

				qnaList.add(bBean);
			}
		} catch (Exception err) {
			System.out.println("getqnaList : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return qnaList;
	}// getqnaList

	// 게시물이 몇개냐 이놈
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = getConnection();
			sql = "select count(*) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception err) {
			System.out.println("getqnaCount에서 오류 : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
		return count;

	}// getqnaCount

	// 게시물 작성
	public void insertBoard(BoardBean bBean) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0;

		try {
			sql = "select max(num) from qna";
			con = getConnection();

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			// insert SQL
			sql = "insert into qna(num,name,email,subject,message,"
					+ "readcount,date,ip,secret,answer) values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, bBean.getName());
			pstmt.setString(3, bBean.getEmail());
			pstmt.setString(4, bBean.getSubject());
			pstmt.setString(5, bBean.getMessage());
			pstmt.setInt(6, 0);
			pstmt.setTimestamp(7, bBean.getDate());
			pstmt.setString(8, bBean.getIp());
			pstmt.setInt(9, bBean.getSecret());
			pstmt.setString(10, null);

			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("insertqna : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}// insertqna

	public void editAnswer(BoardBean bBean, int num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			sql = "update qna set answer = ? where num = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bBean.getAnswer());
			pstmt.setInt(2, num);

			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("editAnswer : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}

	public void deleteAnswer(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			sql = "update qna set answer = null where num = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("editAnswer : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}

	public void updateAnswer(BoardBean bBean, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			sql = "update qna set answer = ? where num = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bBean.getAnswer());
			pstmt.setInt(2, num);

			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("editAnswer : " + err);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException err) {
				err.printStackTrace();
			}
		}
	}

}