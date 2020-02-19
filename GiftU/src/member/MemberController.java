package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import coupon.CouponDAO;
import coupon.PointBean;
import coupon.PointDAO;
import history.HistoryBean;

@SuppressWarnings("serial")
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	MemberDAO memberDAO;
	CouponDAO couponDAO;
	PointDAO pointDAO;

	@Override
	public void init() throws ServletException {
		memberDAO = new MemberDAO();
		couponDAO = new CouponDAO();
		pointDAO = new PointDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		MemberService ms = new MemberService();
		PrintWriter out = null;
		HttpSession session = null;
		try {
			String nextPage = null;
			if (action == null || action.equals("/memberInfo.do")) {

				String id = request.getParameter("id");

				@SuppressWarnings("rawtypes")
				List membersList = memberDAO.listMembers(id);
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);

				request.setAttribute("membersList", membersList);
				request.setAttribute("count", count);
				request.setAttribute("total", total);
				nextPage = "/register/memberInfo.jsp";
			}

			/*-----------------------memberForm.do---------------------------*/
			else if (action.equals("/memberForm.do")) {
				nextPage = "/register/register.jsp";
			}

			/*----------------------insertMember.do---------------------------*/
			else if (action.equals("/insertMember.do")) {

				String id = request.getParameter("id");
				String pass = request.getParameter("pass");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				String address_2 = request.getParameter("address_2");
				String address_3 = request.getParameter("address_3");
				String tel = request.getParameter("tel");
				String tel_2 = request.getParameter("tel_2");
				String dday_1 = request.getParameter("dday_1");
				String ddate_1 = request.getParameter("ddate_1");
				String dday_2 = request.getParameter("dday_2");
				String ddate_2 = request.getParameter("ddate_2");
				String dday_3 = request.getParameter("dday_3");
				String ddate_3 = request.getParameter("ddate_3");

				MemberBean memberVO = new MemberBean(id, pass, name, email, address, address_2, address_3, tel, tel_2,
						dday_1, ddate_1, dday_2, ddate_2, dday_3, ddate_3);
				memberDAO.insertMember(memberVO);
				nextPage = "/login/login.jsp";

			}
			/*-----------------------memberModi.do---------------------------*/
			else if (action.equals("/memberModi.do")) {

				String id = request.getParameter("id");

				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);
				MemberBean memInfo = memberDAO.findMember(id);

				request.setAttribute("memInfo", memInfo);
				request.setAttribute("count", count);
				request.setAttribute("total", total);

				nextPage = "/register/memberModi.jsp";

			}
			/*-----------------------memberModi_info.do---------------------------*/
			else if (action.equals("/memberModi_info.do")) {

				String id = request.getParameter("id");
				String pass = request.getParameter("pass");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				String address_2 = request.getParameter("address_2");
				String address_3 = request.getParameter("address_3");
				String tel = request.getParameter("tel");
				String tel_2 = request.getParameter("tel_2");
				String dday_1 = request.getParameter("dday_1");
				String ddate_1 = request.getParameter("ddate_1");
				String dday_2 = request.getParameter("dday_2");
				String ddate_2 = request.getParameter("ddate_2");
				String dday_3 = request.getParameter("dday_3");
				String ddate_3 = request.getParameter("ddate_3");

				MemberBean memberVO = new MemberBean(id, pass, name, email, address, address_2, address_3, tel, tel_2,
						dday_1, ddate_1, dday_2, ddate_2, dday_3, ddate_3);

				memberDAO.modMember(memberVO);
				request.setAttribute("msg", "modified");
				nextPage = "/member/memberInfo.do";

			}
			
			
			/*-----------------------memberPass.do---------------------------*/
			else if (action.equals("/memberPass.do")) {
				
				String id= request.getParameter("id");
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);
				
				request.setAttribute("id", id);
				request.setAttribute("count", count);
				request.setAttribute("total", total);

				nextPage = "/register/memberPass.jsp";

			}
			/*-----------------------memberPass_info.do---------------------------*/
			else if (action.equals("/memberPass_info.do")) {

				String id = request.getParameter("id");
				String pass= request.getParameter("pass");
				String pass1 = request.getParameter("pass1");
				int check = 0;
				
				check = memberDAO.updatePass(pass, pass1, id);

				PrintWriter pw = response.getWriter();
				
				if(check == 1){
					pw.print("<script>" 
							+" alert('수정 되었습니다.');"
							+" location.href='"+request.getContextPath()+"/member/memberInfo.do?id="+id+"';"
							+"</script>");
					
				}else if(check == 0){
					pw.print("<script>" 
							+" alert('기존 비밀번호가 맞지 않습니다.');"
							+" location.href='"+request.getContextPath()+"/member/memberPass.do';"
							+"</script>");
				}

			}
			
			
			/*-----------------------memberDel.do---------------------------*/
			else if (action.equals("/memberDel.do")) {

				String id = request.getParameter("id");

				MemberBean memDel = memberDAO.findMember(id);
				request.setAttribute("memDel", memDel);
				nextPage = "/register/delmem.jsp";

			}

			/*-----------------------confirm.do(수정진행중..)---------------------------*/
			else if (action.equals("/confirm.do")) {

				String id = request.getParameter("id");

				nextPage = "/login/sendOrder_email.jsp";
				System.out.println(id);
			}

			/*-----------------------delmem.do---------------------------*/
			else if (action.equals("/delmem.do")) {
				String id = request.getParameter("id");
				String pass = request.getParameter("pass");

				memberDAO = new MemberDAO();
				int result = memberDAO.memberDelete(id, pass);

				if (result == 1) {

					session = request.getSession();
					session.invalidate();
					request.setAttribute("msg", "deleted");

					nextPage = "/register/memberInfo.jsp";

				} else {
					request.setAttribute("msg", "pass_confirm");
					nextPage = "/register/delmem.jsp";
				}
			}

			/*-----------------------login.do---------------------------*/
			else if (action.equals("/login.do")) {

				nextPage = "/login/login.jsp";
			}

			/*-----------------------logout.do--------------------------*/
			else if (action.equals("/logout.do")) {

				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0 ; i < cookies.length ;  i++) {
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						response.addCookie(cookies[i]);
					}
				}
	
				session = request.getSession();
				session.removeAttribute("id");

				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("location.href='" + request.getContextPath() + "/index/index.do'");
				pw.print("</script>");
			}

			/*-----------------------checkLogin.do---------------------------*/
			else if (action.equals("/checkLogin.do")) {
				// 1 , 0 , -1
				String id = request.getParameter("id");
				String pass = request.getParameter("pass");
				int cookieCheck = Integer.parseInt(request.getParameter("cookie"));
				int result = ms.checkUser(id, pass);
				out = response.getWriter();
				if (result == -1) {
					out.print("-1");
					return;

				} else if (result == 0) {
					out.print("0");
					return;
				}
				if (result == 1) {
					if (cookieCheck == 1) {
						Cookie cid = new Cookie("id", id);
						cid.setMaxAge(60 * 60 * 24 * 3);
						cid.setPath("/");
						response.addCookie(cid);
						Cookie cpw = new Cookie("pass", pass);
						cpw.setMaxAge(60 * 60 * 24 * 3);
						cpw.setPath("/");
						response.addCookie(cpw);
						response.setContentType("text/html;charset=utf-8");
					}
					session = request.getSession();
					session.setAttribute("id", id);
					out.print("1");
					return;
				}
			}

			/*-----------------------successLogin.do---------------------------*/
			else if (action.equals("/successLogin.do")) {
				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("location.href='" + request.getContextPath() + "/index/index.do'");
				pw.print("</script>");

			} else if (action.equals("/cookieLogin.do")) {
				String id = request.getParameter("id");
				String pass = request.getParameter("pass");
				int result = ms.checkUser(id, pass);
				if (result == 1) {
					session = request.getSession();
					session.setAttribute("id", id);
				}
				nextPage = "/index/index.do";
			}

			/*-----------------------findId.do---------------------------*/
			else if (action.equals("/findId.do")) {
				nextPage = "/login/findId.jsp";
			}

			/*-----------------------findIdPro.do---------------------------*/
			else if (action.equals("/findIdPro.do")) {

				String email = null;
				email = request.getParameter("email");
				int result = ms.findEmail(email);

				if (result == 0) {
					request.setAttribute("msg", "non_findId");
					nextPage = "/member/findPw.do";
				} else {
					request.setAttribute("find_email", email);
					nextPage = "/member/sendIdEmail.do";
				}
			}

			/*-----------------------sendIdEmail.do---------------------------*/
			else if (action.equals("/sendIdEmail.do")) {

				String email = (String) request.getAttribute("find_email");
				int result = ms.sendIdEmail(email);

				if (result == 0) {
					request.setAttribute("msg", "email_cancel");
					nextPage = "/member/findId.do";
				} else {
					request.setAttribute("msg", "email_success");
					nextPage = "/member/findId.do";
				}
			}

			/*-----------------------findPw.do---------------------------*/
			else if (action.equals("/findPw.do")) {
				nextPage = "/login/findPw.jsp";
			}

			/*-----------------------findPwPro.do---------------------------*/
			else if (action.equals("/findPwPro.do")) {

				String id = null;
				id = request.getParameter("p_id");
				String pw = ms.findPw(id);

				if (pw == "") {
					out = response.getWriter();
					out.print("<script>" + "  alert('없음');" + " location.href='" + request.getContextPath()
							+ "/member/findPw.do';" + "</script>");
				} else {
					String email = ms.getEmail(id);
					int result = ms.sendPwEmail(id, email, pw);

					if (result == 0) {
						request.setAttribute("msg", "email_cancel");
						nextPage = "/member/findPw.do";
					} else {
						request.setAttribute("msg", "email_success");
						nextPage = "/member/findPw.do";
					}
				}
			}
			/*-----------------------memberCoupon.do---------------------------*/
			else if (action.equals("/memberCoupon.do")) {

				String id = request.getParameter("id");

				List couponsList = couponDAO.getCouponList(id);
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);

				request.setAttribute("couponsList", couponsList);
				request.setAttribute("count", count);
				request.setAttribute("total", total);

				nextPage = "/register/coupon.jsp";

			}

			/*-----------------------myAddress.do---------------------------*/
			else if (action.equals("/myAddress.do")) {

				String id = request.getParameter("id");
				System.out.println("/myAddress.do");
				System.out.println("id는" + id);
				List<MemberBean> list = ms.getMemberInfo(id);
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("name", list.get(0).getName());
				jsonObject.put("post_code", list.get(0).getAddress());
				jsonObject.put("address", list.get(0).getAddress_2());
				jsonObject.put("address2", list.get(0).getAddress_3());
				jsonObject.put("phone", list.get(0).getTel());
				jsonObject.put("phone2", list.get(0).getTel_2());
				jsonObject.put("email", list.get(0).getEmail());
				PrintWriter printer = response.getWriter();
				printer.print(jsonObject);
			}

			/*-----------------------memberCoupon.do---------------------------*/
			else if (action.equals("/memberPoint.do")) {

				String id = request.getParameter("id");

				List pointList = pointDAO.getPointList(id);
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);

				request.setAttribute("count", count);
				request.setAttribute("pointList", pointList);
				request.setAttribute("total", total);

				nextPage = "/register/point.jsp";

			}

			/*-----------------------sendPaymentEmail.do---------------------------*/
			else if (action.equals("/sendPaymentEmail.do")) {
				HistoryBean bean = (HistoryBean) request.getAttribute("bean");
				int result = ms.sendPaymentEmail(bean);
				if (result == 1) {
					System.out.println("이메일 전송 완료");
					nextPage = "/history/searchHistory.do?month=three";
				}
			}

			else {
				String id = request.getParameter("id");
				@SuppressWarnings("rawtypes")
				ArrayList list = (ArrayList) memberDAO.listMembers(id);
				request.setAttribute("membersList", list);
				nextPage = "/register/memberInfo.jsp";
			}
			if (nextPage != null) {
				RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
				dispatch.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("doHandle() 에서 오류");
			e.printStackTrace();
		}
	}
}