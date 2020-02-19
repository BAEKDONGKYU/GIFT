package coupon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;


@WebServlet("/coupon/*") //  /viewArticle.do
public class CouponController extends HttpServlet {
	CouponBean couponBean;
	MemberDAO memberDAO;
	CouponDAO couponDAO;
	PointDAO pointDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		couponBean = new CouponBean();
		memberDAO = new MemberDAO();
		couponDAO = new CouponDAO();
		pointDAO = new PointDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		try {
			List<CouponBean> boardList = new ArrayList<CouponBean>();
			if (action.equals("/addCoupon.do")) { //게시판 메인화면
				
				String id = request.getParameter("id");
				String coupon = request.getParameter("coupon");

				int check = 0;

				check = couponDAO.insertCoupon(id, coupon);
				
				PrintWriter pw = response.getWriter();
				
				if(check == 0){//발급됨
					pw.print("<script>" 
							+" alert('쿠폰이 발급되었습니다.');"
							+" window.close();"
							+"</script>");
					
				}else if(check == 1){//쿠폰 중복
					pw.print("<script>" 
							+" alert('이미 발급된 쿠폰입니다. 쿠폰함을 확인해주세요');"
							+" window.close();"
							+"</script>");
				}
				
			}/*else if(action.equals("/memberCoupon.do")) {
				
				String id = request.getParameter("id");

				List couponsList = couponDAO.getCouponList(id);
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);
				
				request.setAttribute("couponsList", couponsList);
				request.setAttribute("count", count);
				request.setAttribute("total", total);
				
				nextPage = "/register/coupon.jsp";
				
			}*/

			/*RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}