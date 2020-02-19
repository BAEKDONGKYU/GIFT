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


@WebServlet("/listcoupon/*") //  /viewArticle.do
public class ListCouponController extends HttpServlet {
	ListCouponBean listcouponBean;
	ListCouponDAO ListcouponDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		listcouponBean = new ListCouponBean();
		ListcouponDAO = new ListCouponDAO();
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
			List<ListCouponBean> ListCouponList = new ArrayList<ListCouponBean>();
			if (action.equals("/listCoupon.do")) { //게시판 메인화면
				
				ListCouponList = ListcouponDAO.getCouponList();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
				
				request.setAttribute("ListCouponList", ListCouponList);

				nextPage = "/qna_notice/couponList.jsp";

			}else if (action.equals("/addCoupon.do")) { //게시판 메인화면
				
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				int multi = Integer.parseInt(request.getParameter("multi"));
				int price = Integer.parseInt(request.getParameter("price"));	
				String day11 = request.getParameter("day1") + " 00:00:01.111";
				Timestamp day1 = Timestamp.valueOf(day11);
				
				
				String day22 = request.getParameter("day2");
				day22 += " 23:59:59.111";
				Timestamp day2 = Timestamp.valueOf(day22);
				
				int percent = Integer.parseInt(request.getParameter("percent"));
				
				int check = 0;
				
				listcouponBean.setSubject(subject);
				listcouponBean.setContent(content);
				listcouponBean.setMulti(multi);
				listcouponBean.setPrice(price);
				listcouponBean.setDay1(day1);
				listcouponBean.setDay2(day2);
				listcouponBean.setPercent(percent);
				
				check = ListcouponDAO.insertCoupon(listcouponBean);
				
				PrintWriter pw = response.getWriter();
				
				if(check == 0){//발급됨
					pw.print("<script>" 
							+" alert('저장 완료.');"
							+" location.href='"+request.getContextPath()+"/listcoupon/listCoupon.do';"
							+"</script>");
					
				}else if(check == 1){//쿠폰 중복
					pw.print("<script>" 
							+" alert('중복된 이름의 쿠폰이 존재합니다.');"
							+" location.href='"+request.getContextPath()+"/listcoupon/listCoupon.do';"
							+"</script>");
					
				}
				return;
			}

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}