package cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import product.ProductBean;
import product.ProductService;

@WebServlet("/cart/*")
public class cartController extends HttpServlet {
	cartBean cartbean;
	cartService cartservice;

	@Override
	public void init() throws ServletException {
		cartservice = new cartService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String nextPage = "";
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			
			String action = request.getPathInfo();
			System.out.println(action);
		
			try {
				List<cartBean> list;
				if(action.equals("/addCart.do")){
					int num = Integer.parseInt(request.getParameter("num"));
					int count = Integer.parseInt(request.getParameter("count"));
					String name = request.getParameter("name");
					String filename = request.getParameter("filename");
					int price = Integer.parseInt(request.getParameter("price"));
					String id = request.getParameter("id");
					int kind = 0;
					System.out.println(num);
					System.out.println(name);
					cartbean = new cartBean();
					
					cartbean.setId(id);
					cartbean.setCount(count);
					cartbean.setName(name);
					cartbean.setPrice(price);
					cartbean.setFilename(filename);
					cartbean.setDate(new Timestamp(System.currentTimeMillis()));
					cartbean.setKind(kind);
					cartbean.setPro_num(num);
					cartservice.addCart(cartbean,num);
				
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("alert('장바구니에 추가되었습니다.'); ");
					pw.print(" location.href='"+ request.getContextPath() + "/product/viewDetail.do?num="+num + "'");
					pw.print("</script>");
					
					return;
					
			}else if(action.equals("/addCart-form.do")){
				System.out.println("dsadsad");
				int num = Integer.parseInt(request.getParameter("num"));
				String id = request.getParameter("id");
				ProductBean productBean = new ProductBean();
				ProductService proService = new ProductService();
				productBean = proService.getProductInfo(num);
				int kind = 0;
				
			
				cartbean = new cartBean();
				
				cartbean.setId(id);
				cartbean.setCount(1);
				cartbean.setName(productBean.getName());
				cartbean.setPrice(productBean.getPrice());
				cartbean.setFilename(productBean.getFilename());
				cartbean.setDate(new Timestamp(System.currentTimeMillis()));
				cartbean.setKind(kind);
				cartbean.setPro_num(num);
				cartservice.addCart(cartbean,num);
			
				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("alert('장바구니에 추가되었습니다.'); ");
				pw.print(" history.back();");
				pw.print("</script>");
				
				return;
			}else if(action.equals("/listCart.do")){
				String id = request.getParameter("id");
				System.out.println(id);
				int amount = cartservice.getAmount(id,0);
				
				list = cartservice.getCartList(id,0);
				
				request.setAttribute("amount", amount);
				request.setAttribute("cartList", list);
				
				nextPage = "/category/cart.jsp";
			}else if(action.equals("/delList.do")){
				String [] num = request.getParameterValues("cartDelList");
				
				for(int i = 0; i<num.length;i++){
					cartservice.delList(Integer.parseInt(num[i]));
				}
				
				
				nextPage = "/cart/listCart.do";
			
			}else if(action.equals("/modCart.do")){
				String [] count = request.getParameterValues("count");
				String [] num = request.getParameterValues("num");
				
				for(int i=0;i<num.length;i++){
					cartservice.modCart(Integer.parseInt(num[i]), Integer.parseInt(count[i]));
				}
	
				nextPage = "/cart/listCart.do";
			}else if(action.equals("/addHeart.do")){
				int num = Integer.parseInt(request.getParameter("num"));
				System.out.println(num);
				String id = request.getParameter("id");
				ProductBean productBean = new ProductBean();
				ProductService proService = new ProductService();
				productBean = proService.getProductInfo(num);
				int kind = 1;
				
				
				cartbean = new cartBean();
				System.out.println(num);
				cartbean.setId(id);
				cartbean.setCount(1);
				cartbean.setName(productBean.getName());
				cartbean.setPrice(productBean.getPrice());
				cartbean.setFilename(productBean.getFilename());
				cartbean.setDate(new Timestamp(System.currentTimeMillis()));
				cartbean.setKind(kind);
				cartbean.setPrice(num);
	
				
				cartservice.addCart(cartbean,num);
			
				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("alert('찜!'); ");
				pw.print(" history.back();");
				pw.print("</script>");
				
				return;
			}else if(action.equals("/heartList.do")){
				String id = request.getParameter("id");
				System.out.println(id);
				list = cartservice.getHeartList(id,1);
				request.setAttribute("heartList", list);
				nextPage = "/category/heart.jsp";
			}else if(action.equals("/delHeartList.do")){
				
				String [] num = request.getParameterValues("delHeartList");
				
				for(int i=0;i<num.length;i++){
					System.out.println(num[i]);
					cartservice.delHeartList(Integer.parseInt(num[i]),1);
				}
				nextPage = "/cart/heartList.do";
			}
				
				
				
				
				RequestDispatcher dis = request.getRequestDispatcher(nextPage);
				dis.forward(request, response);
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
	}
}
