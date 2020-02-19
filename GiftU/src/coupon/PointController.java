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


@WebServlet("/point/*") //  /viewArticle.do
public class PointController extends HttpServlet {
	PointBean pointBean;
	MemberDAO memberDAO;
	CouponDAO couponDAO;
	PointDAO pointDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
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
			List<PointBean> pointList = new ArrayList<PointBean>();
			/*if (action.equals("/listPoint.do")) { //게시판 메인화면
				
				String id = request.getParameter("id");
				
				pointList = pointDAO.getPointList(id);
				int count = couponDAO.getCouponCount(id);
				int total = pointDAO.getTotal(id);


				request.setAttribute("count", count);
				request.setAttribute("pointList", pointList);
				request.setAttribute("total", total);
				
				nextPage = "/register/point.jsp";

			}*/

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}