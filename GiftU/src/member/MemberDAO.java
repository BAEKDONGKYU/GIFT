package member;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}

	/* 회원정보 체크하는 메서드 */
	public int userCheck(String id, String pass) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return check;
	}

	public int idCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return check;
	}

	/* 회원가입 메서드 */
	public void insertMember(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "INSERT INTO member(id,pass,name,email,address,address_2,address_3,tel,tel_2,dday_1, ddate_1,dday_2,ddate_2,dday_3,ddate_3)"
					+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPass());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setString(5, memberBean.getAddress());
			pstmt.setString(6, memberBean.getAddress_2());
			pstmt.setString(7, memberBean.getAddress_3());
			pstmt.setString(8, memberBean.getTel());
			pstmt.setString(9, memberBean.getTel_2());
			pstmt.setString(10, memberBean.getDday_1());
			pstmt.setString(11, memberBean.getDdate_1());
			pstmt.setString(12, memberBean.getDday_2());
			pstmt.setString(13, memberBean.getDdate_2());
			pstmt.setString(14, memberBean.getDday_3());
			pstmt.setString(15, memberBean.getDdate_3());

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertMember()에서 오류");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	/* 회원정보 불러오는 메서드 */
	public MemberBean findMember(String _id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		MemberBean memInfo = null;

		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _id);

			ResultSet rs = pstmt.executeQuery();

			rs.next();

			String id = rs.getString("id");
			String pass = rs.getString("pass");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String address = rs.getString("address");
			String address_2 = rs.getString("address_2");
			String address_3 = rs.getString("address_3");
			String tel = rs.getString("tel");
			String tel_2 = rs.getString("tel_2");
			String dday_1 = rs.getString("dday_1");
			String ddate_1 = rs.getString("ddate_1");
			String dday_2 = rs.getString("dday_2");
			String ddate_2 = rs.getString("ddate_2");
			String dday_3 = rs.getString("dday_3");
			String ddate_3 = rs.getString("ddate_3");

			memInfo = new MemberBean(id, pass, name, email, address, address_2, address_3, tel, tel_2, dday_1, ddate_1,
					dday_2, ddate_2, dday_3, ddate_3);

			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println("findMember()에서 오류");
			e.printStackTrace();
		}
		return memInfo;
	}

	public List listMembers(String _id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		List list = new ArrayList();
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean vo = new MemberBean();
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress_2(rs.getString("address_2"));
				vo.setAddress_3(rs.getString("address_3"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setTel_2(rs.getString("tel_2"));
				vo.setDday_1(rs.getString("dday_1"));
				vo.setDdate_1(rs.getString("ddate_1"));
				vo.setDday_2(rs.getString("dday_2"));
				vo.setDdate_2(rs.getString("ddate_2"));
				vo.setDday_3(rs.getString("dday_3"));
				vo.setDdate_3(rs.getString("ddate_3"));

				list.add(vo);
			}

			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void modMember(MemberBean memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {

			con = getConnection();
			sql = "UPDATE member SET name=?,email=?,address=?,address_2=?,address_3=?,tel=?,tel_2=?,dday_1=?,ddate_1=?,dday_2=?,ddate_2=?,dday_3=?,ddate_3=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			// ?�꽕�젙
			pstmt.setString(1, memberVO.getName());
			pstmt.setString(2, memberVO.getEmail());
			pstmt.setString(3, memberVO.getAddress());
			pstmt.setString(4, memberVO.getAddress_2());
			pstmt.setString(5, memberVO.getAddress_3());
			pstmt.setString(6, memberVO.getTel());
			pstmt.setString(7, memberVO.getTel_2());
			pstmt.setString(8, memberVO.getDday_1());
			pstmt.setString(9, memberVO.getDdate_1());
			pstmt.setString(10, memberVO.getDday_2());
			pstmt.setString(11, memberVO.getDdate_2());
			pstmt.setString(12, memberVO.getDday_3());
			pstmt.setString(13, memberVO.getDdate_3());
			pstmt.setString(14, memberVO.getId());

			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception err) {
			err.printStackTrace();
		}
	}

	public int memberDelete(String id, String pass) {
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {

			con = getConnection();
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					result = 1;
					sql = "delete from member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);

					pstmt.executeUpdate();
				} else {
					result = 0;
				}
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception err) {
			err.printStackTrace();
		}
		return result;
	}

	public int findEmail(String email) {

		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select email from member where email = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (Exception e) {
			System.out.println("findEmail()에서 오류발생.");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println("자원해제오류");
				e.printStackTrace();
			}
		}
		return result;
	}

	public String findId(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = "";

		String sql = "select id from member where email = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("findId()에서 오류" + e);
			e.printStackTrace();
		} finally {
			// �옄�썝�빐�젣
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println("아이디 찾기에서 오류");
				e.printStackTrace();
			}
		}

		return id;
	}

	public String findPw(String id) {
		String result = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from member where id = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		return result;
	}

	public String getEmail(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		String sql = "select email from member where id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}

		return result;
	}
	
	public int updatePass(String pass, String pass1, String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;

		try {
			sql = "select pass from member where id=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if(pass.equals(rs.getString("pass"))){
					
					check = 1;
					sql = "update member set pass=? where id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, pass1);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					
				}else{
					check = 0;
				}
					
			}
		} catch (Exception err) {
			System.out.println("updatePass에서 오류 발생 : " + err);
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
		return check;
	}

}
