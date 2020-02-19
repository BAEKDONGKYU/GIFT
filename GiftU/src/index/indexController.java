package index;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductBean;
import product.ProductService;

@WebServlet("/index/*")
public class indexController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nextPage = "";
		
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=utf-8");

		String action = request.getPathInfo();
		System.out.println(action);
		
		try {
			List<ProductBean> list;
			if(action.equals("/index.do")){
				ProductService ps = new ProductService();
				
				list = ps.getTopPro();
				
			
				request.setAttribute("list", list);
	
				nextPage = "/main/index.jsp";
			}
			
			RequestDispatcher dis = request.getRequestDispatcher(nextPage);
			dis.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("index error"  + e);
		}
	}
	
	
}
