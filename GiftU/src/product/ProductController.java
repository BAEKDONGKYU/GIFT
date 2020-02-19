package product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cart.cartBean;
import cart.cartDAO;
import cart.cartService;
import coupon.CouponBean;
import coupon.CouponDAO;
import coupon.ListCouponBean;
import history.HistoryDAO;
import product_comment.Product_commentBean;
import product_comment.Product_commentDAO;

@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	ProductService productService;
	ProductBean productBean;
	Product_commentBean cbean;
	cartService cartService;
	CouponBean couponBean;
	CouponDAO couponDAO;
	
	
	@Override
	public void init() throws ServletException {
		productService = new ProductService();
		cartService = new cartService();
		couponBean = new CouponBean();
		couponDAO = new CouponDAO();
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

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextPage = "";
		productBean = new ProductBean();
		cbean = new Product_commentBean();
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=utf-8");

		String action = request.getPathInfo();
		System.out.println(action);

		try {
			List<ProductBean> productList;
			List<CouponBean> CouponList = new ArrayList<CouponBean>();

			if (action == null) {
				String _section = request.getParameter("section");
				String _pageNum = request.getParameter("pageNum");

				int section = Integer.parseInt((_section == null) ? "1" : _section);
				int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
				Map<String, Integer> pageMap = new HashMap<String, Integer>();

				pageMap.put("sction", section);
				pageMap.put("pageNum", pageNum);

				Map<String, Integer> productMap = new HashMap<String, Integer>();

				productMap = productService.listProducts(pageMap);
				productMap.put("section", section);
				productMap.put("pageNum", pageNum);
				int totalProduct = productService.getTotalProduct();
				System.out.println(totalProduct);
				request.setAttribute("totalProduct", totalProduct);
				request.setAttribute("productMap", productMap);

				nextPage = "/category/category.jsp";

			} else if (action.equals("/listProducts.do")) {
				String _section = request.getParameter("section");
				String _pageNum = request.getParameter("pageNum");

				int section = Integer.parseInt((_section == null) ? "1" : _section);
				int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);

				Map<String, Integer> pageMap = new HashMap<String, Integer>();

				pageMap.put("section", section);
				pageMap.put("pageNum", pageNum);

				Map<String, Integer> productMap = new HashMap<String, Integer>();

				int totalProduct = productService.getTotalProduct();
				System.out.println(totalProduct);
				request.setAttribute("totalProduct", totalProduct);
				productMap = productService.listProducts(pageMap);
				productMap.put("section", section);
				productMap.put("pageNum", pageNum);

				request.setAttribute("productMap", productMap);
				request.setAttribute("action", action);
				
				nextPage = "/category/category.jsp";
			} else if (action.equals("/productWriteForm.do")) {
				nextPage = "/category/productWrite.jsp";
			}

			else if (action.equals("/addProduct.do")) {
				Map<String, String> proMap = upload(request, response);

				String name = proMap.get("name");
				int price = Integer.parseInt(proMap.get("price"));
				String event = proMap.get("event");
				String gender = proMap.get("gender");
				int age = Integer.parseInt(proMap.get("age"));
				int inventory = Integer.parseInt(proMap.get("inventory"));
				String content = proMap.get("content");
				String  filename = proMap.get("filename");
				String  filename1 = proMap.get("filename1");
				String filename2 = proMap.get("filename2");
		
				productBean.setName(name);
				productBean.setPrice(price);
				productBean.setEvent(event);
				productBean.setGender(gender);
				productBean.setAge(age);
				productBean.setInventory(inventory);
				productBean.setContent(content);
				productBean.setFilename(filename);
				productBean.setFilename1(filename1);
				productBean.setFilename2(filename2);
				productBean.setDate(new Timestamp(System.currentTimeMillis()));

				productService.addProduct(productBean);

				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("location.href='" + request.getContextPath() + "/product/listProducts.do'");
				pw.print("</script>");

				System.out.println(request.getContextPath() + "/product/listProducts.do");

				return;
			}
			
/* �븳 �긽�뭹�뿉���븳 �룷�넗由щ럭瑜� 蹂댁뿬二쇰뒗 page     */
			else if (action.equals("/viewDetail.do")) { 
				String id=request.getParameter("id");
				int num = Integer.parseInt(request.getParameter("num"));
				String event=request.getParameter("event");
				productBean = productService.getProduct(num);
				request.setAttribute("productDetail", productBean);	
				HistoryDAO hdao=new HistoryDAO();
				String hid=hdao.id_list(id);
				String hfname=hdao.fname_list(id);
				List<Product_commentBean> clist_r = new ArrayList<Product_commentBean>(); //�룷�넗由щ럭 list
				List<Product_commentBean> list_d= new ArrayList<Product_commentBean>(); //愿�由ъ옄媛� �룷�넗由щ럭�뿉 �궓湲� �떟湲�
				List<ProductBean> list_e=new ArrayList<ProductBean>(); //愿��젴 �씠踰ㅽ듃 list
				
				
				int pageSize = 3;
				int pageBlock = 3;
				int count_r = productService.countComment_r(num);

				list_d= productService.listComments_d(num); 
						
				String pageNum_r = request.getParameter("pageNum_r");

				if(pageNum_r==null){
					pageNum_r="1";
				}
				
				int currentPage_r = Integer.parseInt(pageNum_r);
				int startRow_r = (currentPage_r -1) * pageSize;	
				int pageCount_r = count_r / pageSize + (count_r%pageSize == 0 ? 0 : 1);		
				int startPage_r = ((currentPage_r/pageBlock)-(currentPage_r%pageBlock==0?1:0))*pageBlock+1;			
				int endPage_r = startPage_r + pageBlock -1;				
				int sum=productService.sumStar(num); // 蹂꾩젏�빀援ы븯湲�
				
				if(endPage_r > pageCount_r){
					endPage_r = pageCount_r;
				}
				
				
				int count_e = productService.countComment_e(event);
						
				String pageNum_e = request.getParameter("pageNum_e");

				if(pageNum_e==null){
					pageNum_e="1";
				}
				
				int currentPage_e = Integer.parseInt(pageNum_e);
				int startRow_e = (currentPage_e -1) * pageSize;	
				int pageCount_e = count_e / pageSize + (count_e%pageSize == 0 ? 0 : 1);		
				int startPage_e = ((currentPage_e/pageBlock)-(currentPage_e%pageBlock==0?1:0))*pageBlock+1;			
				int endPage_e = startPage_e + pageBlock -1;			

				
				if(endPage_e > pageCount_e){
					endPage_e = pageCount_e;
				}
			
				list_e=productService.event_p(startRow_e, pageSize,event);
				clist_r = productService.listComments_r(startRow_r, pageSize,num);
				
				request.setAttribute("clist_r", clist_r);
				request.setAttribute("list_d", list_d);
				request.setAttribute("list_e", list_e);
				request.setAttribute("hid", hid);
				request.setAttribute("hfname", hfname);
				request.setAttribute("pageNum_r", pageNum_r);
				request.setAttribute("count_r", count_r);
				request.setAttribute("sum",sum);			
				request.setAttribute("pageCount_r", pageCount_r);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage_r", startPage_r);
				request.setAttribute("endPage_r", endPage_r);
				
				System.out.println("hid= "+ hid+ ", hfname= "+hfname);
				System.out.println("list_e= "+ list_e);
				
				nextPage = "/category/viewDetail.jsp";

			}
/* �븳 �긽�뭹�뿉���븳 �룷�넗由щ럭瑜� 蹂댁뿬二쇰뒗 page   */		
			
/* �븳 �긽�뭹�뿉���븳 �씪諛섎━酉곕�� 蹂댁뿬二쇰뒗 page   */			
			else if (action.equals("/viewDetail2.do")) {
				String id=request.getParameter("id");
				int num = Integer.parseInt(request.getParameter("num"));		
				productBean = productService.getProduct(num);
				request.setAttribute("productDetail", productBean);	
				String event=request.getParameter("event");
				
				HistoryDAO hdao=new HistoryDAO();
				String hid=hdao.id_list(id);
				String hfname=hdao.fname_list(id);
				
				int pageSize = 3;
				int pageBlock = 3;
				List<Product_commentBean> clist = new ArrayList<Product_commentBean>(); // �씪諛섎뙎湲� list
				List<Product_commentBean> list_c= new ArrayList<Product_commentBean>(); //愿�由ъ옄媛� �씪諛섎뙎湲��뿉 �궓湲� �떟湲�
				List<ProductBean> list_e=new ArrayList<ProductBean>(); //愿��젴 �씠踰ㅽ듃 list
				int count_e = productService.countComment_e(event);

				String pageNum_e = request.getParameter("pageNum_e");

				if(pageNum_e==null){
					pageNum_e="1";
				}
				
				int currentPage_e = Integer.parseInt(pageNum_e);
				int startRow_e = (currentPage_e -1) * pageSize;	
				int pageCount_e = count_e / pageSize + (count_e%pageSize == 0 ? 0 : 1);		
				int startPage_e = ((currentPage_e/pageBlock)-(currentPage_e%pageBlock==0?1:0))*pageBlock+1;			
				int endPage_e = startPage_e + pageBlock -1;				

				
				if(endPage_e > pageCount_e){
					endPage_e = pageCount_e;
				}
			
				list_e=productService.event_p(startRow_e, pageSize,event);
				
				int count = productService.countComment(num);
				list_c= productService.listComments_c(num); 
				String pageNum = request.getParameter("pageNum");
				
				if(pageNum==null){
					pageNum="1";
				}
				
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage -1) * pageSize;	
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
				
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				clist = productService.listComments(startRow, pageSize,num);
				request.setAttribute("clist", clist);			    		
				request.setAttribute("pageNum", pageNum);			
				request.setAttribute("count", count);
				request.setAttribute("list_e", list_e);
				request.setAttribute("hid", hid);
				request.setAttribute("hfname", hfname);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list_c", list_c);

				nextPage = "/category/viewDetail2.jsp";
			}			
/* �븳 �긽�뭹�뿉���븳 �씪諛섎━酉곕�� 蹂댁뿬二쇰뒗 page  */	
			
/* index.jsp�뿉�꽌 �긽�뭹寃��깋  */		
			else if (action.equals("/ProductSearchController.do")) {

				String event = request.getParameter("event");
				String gender = request.getParameter("gender");
				int age = Integer.parseInt(request.getParameter("age"));
				int price = Integer.parseInt(request.getParameter("price"));
				
				
				System.out.println(event);
				System.out.println(gender);
				System.out.println(age);
				System.out.println(price);

				ProductDAO pdao = new ProductDAO();

				Vector<ProductBean> v = pdao.getProductList(event, gender, age, price);
				
				request.setAttribute("productList", v);
		
				nextPage = "/category/category.jsp";
			}
/* index.jsp�뿉�꽌 �긽�뭹寃��깋  */	
			
/* �븳 �긽�뭹�뿉���븳 �씪諛섎━酉� 異붽�  */
			else if (action.equals("/addComment.do")) { 
				System.out.println("sadsads");
				String id = request.getParameter("id");
				int num = Integer.parseInt(request.getParameter("num"));
				int comment_num = Integer.parseInt(request.getParameter("comment_num"));
				String comment = request.getParameter("comment");
				String filename = "emi.gif";
				cbean.setNum(num);
				cbean.setComment_num(comment_num);
				cbean.setName(id);
				cbean.setContent(comment);
				cbean.setFilename(filename);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));

				Product_commentDAO cdao = new Product_commentDAO();
	            ProductDAO pdao=new ProductDAO();
	            cdao.addComment(cbean);
	            pdao.upReview(num);
	            nextPage = "/product/viewDetail2.do?num="+num;
				
				
			}
/* �븳 �긽�뭹�뿉���븳 �씪諛섎━酉� 異붽�  */
			
/* �븳 �긽�뭹�뿉���븳 �씪諛섎뙎湲� �닔�젙  */
			else if (action.equals("/modifyComment.do")) { // 媛� �긽�뭹�쓽 �뙎湲�

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));

				cbean = productService.commentUpdate(num, num_c);

				request.setAttribute("comment", cbean);
				request.setAttribute("pageNum", pageNum);

				nextPage = "/category/comment.jsp";

			}

			
			
			else if (action.equals("/updateProComment.do")) {
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				String num_c = request.getParameter("num_c");
				String content = request.getParameter("content");

				cbean.setContent(content);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));

				productService.updateComment(cbean, Integer.parseInt(num), Integer.parseInt(num_c));
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('�닔�젙�릺�뿀�뒿�땲�떎.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail.do?num=" + num + "&pageNum=" + pageNum + "&num_c=" + num_c + "';"
						+ "</script>");

				return;
			}
/* �븳 �긽�뭹�뿉���븳 �씪諛섎뙎湲� �닔�젙  */
			
/* �븳 �긽�뭹�뿉���븳 �씪諛섎뙎湲� �궘�젣  */
			else if (action.equals("/delComment.do")) { // �뙎湲� �궘�젣

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String pageNum = request.getParameter("pageNum");

				productService.delComment(num, num_c);
				 productService.delComment_double(num, num_c);
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('�궘�젣�릺�뿀�뒿�땲�떎.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail2.do?num=" + num + "&pageNum=" + pageNum + "';" + "</script>");

				return;

			}
/* �븳 �긽�뭹�뿉���븳 �씪諛섎뙎湲� �궘�젣  */
			
			
/* �씪諛섎뙎湲��뿉 ���븳 愿�由ъ옄�쓽 �떟湲�  */
			else if (action.equals("/replyComment.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String comment_reply = request.getParameter("comment_reply");
				String id = request.getParameter("id");
				int comment_num = Integer.parseInt(request.getParameter("comment_num"));

				cbean.setNum(num);
				cbean.setNum_c(num_c);
				cbean.setComment_num(comment_num);
				cbean.setName(id);
				cbean.setContent(comment_reply);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));

				Product_commentDAO cdao = new Product_commentDAO();
				cdao.reInsertComment(cbean);

				nextPage = "/product/viewDetail.do";

			}
/* �씪諛섎뙎湲��뿉 ���븳 愿�由ъ옄�쓽 �떟湲�  */
			
/* �씪諛섎뙎湲��뿉 ���븳 愿�由ъ옄�쓽 �떟湲� �궘�젣  */
			else if (action.equals("/delReview_m.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String pageNum = request.getParameter("pageNum");

				productService.delReview_m(num, num_c);

				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('�궘�젣�릺�뿀�뒿�땲�떎.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail.do?num=" + num + "&pageNum=" + pageNum + "';" + "</script>");

				return;

			}
/* �씪諛섎뙎湲��뿉 ���븳 愿�由ъ옄�쓽 �떟湲� �궘�젣  */
			
			/* �븳 �긽�뭹�뿉���븳 �룷�넗由щ럭 異붽�  */
			else if (action.equals("/addComment_r.do")) { 
				System.out.println("addComment");
				Map<String, String> reviewMap = review_upload(request, response);

				String id = reviewMap.get("id");
				int num = Integer.parseInt(reviewMap.get("num"));
				int comment_num = Integer.parseInt(reviewMap.get("comment_num"));
				String comment_r = reviewMap.get("comment_r");
				String filename = reviewMap.get("filename");
				int starcount = Integer.parseInt(reviewMap.get("starcount"));

				cbean.setNum(num);
				cbean.setName(id);
				cbean.setComment_num(comment_num);
				cbean.setContent(comment_r);
				cbean.setFilename(filename);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));
				cbean.setStarcount(starcount);

				Product_commentDAO cdao = new Product_commentDAO();
				ProductDAO pdao=new ProductDAO();
				cdao.addComment_r(cbean);
				pdao.upReview(num);
				nextPage = "/product/viewDetail.do?num="+num;

			}
/* �븳 �긽�뭹�뿉���븳 �룷�넗由щ럭 異붽�  */
			
/* �룷�넗由щ럭 �닔�젙  */
			else if (action.equals("/modifyReview.do")) { // 媛� 由щ럭 �뙎湲�

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				int pageNum_r = Integer.parseInt(request.getParameter("pageNum_r"));
				
				cbean = productService.reviewUpdate(num, num_c);
				
				
				request.setAttribute("comment_r", cbean);
				request.setAttribute("pageNum_r", pageNum_r);
				
				nextPage = "/category/review.jsp";

			}

			else if (action.equals("/updateProReview.do")) {
				
				Map<String, String> reviewMap = review_upload(request, response);
				
				int num =Integer.parseInt(request.getParameter("num"));
		        int num_c = Integer.parseInt(request.getParameter("num_c"));
		        String content = reviewMap.get("content");
		        String filename = reviewMap.get("filename");
		        int starcount = Integer.parseInt(reviewMap.get("starcount"));
		        int pageNum_r = Integer.parseInt(request.getParameter("pageNum_r"));
		        
				cbean.setContent(content);
				cbean.setFilename(filename);
				cbean.setStarcount(starcount);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));
				
				productService.updateReview(cbean, num,num_c);
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('수정되었습니다.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail.do?num=" + num + "&pageNum_r=" + pageNum_r + "&num_c=" + num_c + "';"
						+ "</script>");

				return;
			}
/* �룷�넗由щ럭 �닔�젙  */
			
/* �룷�넗由щ럭 �궘�젣  */
			else if (action.equals("/delReview.do")) { // �뙎湲� �궘�젣

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String pageNum_r = request.getParameter("pageNum_r");

				productService.delReview(num, num_c);
				 productService.delComment_double(num, num_c);
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('삭제되었습니다.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail.do?num=" + num + "&pageNum_r=" + pageNum_r + "';" + "</script>");

				return;

			}
/* �룷�넗由щ럭 �궘�젣  */
			
/* �룷�넗由щ럭�뿉 ���븳 愿�由ъ옄�쓽 �떟湲� 異붽� */	
			else if (action.equals("/replyReview.do")) { 

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String comment_reply = request.getParameter("review_reply");
				String id = request.getParameter("id");
				int comment_num = Integer.parseInt(request.getParameter("comment_num"));

				cbean.setNum(num);
				cbean.setNum_c(num_c);
				cbean.setComment_num(comment_num);
				cbean.setName(id);
				cbean.setContent(comment_reply);
				cbean.setDate(new Timestamp(System.currentTimeMillis()));

				Product_commentDAO cdao = new Product_commentDAO();
				cdao.reInsertReview(cbean);//

				nextPage = "/product/viewDetail.do";

			}
/* �룷�넗由щ럭�뿉 ���븳 愿�由ъ옄�쓽 �떟湲� 異붽� */	
			
/* �룷�넗由щ럭�뿉 ���븳 愿�由ъ옄�쓽 �떟湲� �궘�젣  */
			else if (action.equals("/delReview_d.do")) {

				int num = Integer.parseInt(request.getParameter("num"));
				int num_c = Integer.parseInt(request.getParameter("num_c"));
				String pageNum_r = request.getParameter("pageNum_r");

				productService.delReview_d(num, num_c);

				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('리뷰가 삭제되었습니다.');" + " location.href='" + request.getContextPath()
						+ "/product/viewDetail.do?num=" + num + "&pageNum_r=" + pageNum_r + "';" + "</script>");

				return;

			}
/* �룷�넗由щ럭�뿉 ���븳 愿�由ъ옄�쓽 �떟湲� �궘�젣  */
			
			 else if(action.equals("/goodssearch.do")){
		            
		            String name = request.getParameter("searchgoods");
		            
		            ProductDAO pdao = new ProductDAO();
		            
		            List<ProductBean> list = new ArrayList<ProductBean>();
		            
		            list = pdao.getListGoods(name);
		            
		            request.setAttribute("productList", list);
		            
		            nextPage = "/category/category.jsp";
		         }
			
			 else if (action.equals("/delProduct.do")) {
					int num = Integer.parseInt(request.getParameter("num"));
					productService.delProduct(num);
					Product_commentDAO cdao=new Product_commentDAO();
					cdao.delComment_all(num);
					cartDAO cart = new cartDAO();
					cart.delCart(num);
					nextPage = "/product/listProducts.do";
				} 
			 	else if (action.equals("/delList.do")) {
					
			 		String[] num = request.getParameterValues("delList");
					Product_commentDAO cdao=new Product_commentDAO();
					cartDAO cart = new cartDAO();
					
					for (int i = 0; i < num.length; i++) {
						productService.delProduct(Integer.parseInt(num[i]));
						cdao.delComment_all(Integer.parseInt(num[i]));
						cart.delCart(Integer.parseInt(num[i]));
					}
					nextPage = "/product/listProducts.do";
				}else if(action.equals("/modProduct.do")){
					int num = Integer.parseInt(request.getParameter("num"));
					productBean = productService.getProductInfo(num);
					request.setAttribute("productInfo", productBean);
					nextPage = "/category/modProduct.jsp";
				}else if(action.equals("/updatePro.do")){
					Map<String, String> proMap = upload(request, response);
					
					int num = Integer.parseInt(proMap.get("num"));
					String name = proMap.get("name");
					int price = Integer.parseInt(proMap.get("price"));
					String event = proMap.get("event");
					String gender = proMap.get("gender");
					int age = Integer.parseInt(proMap.get("age"));
					int inventory = Integer.parseInt(proMap.get("inventory"));
					String content = proMap.get("content");
					String  filename = proMap.get("filename");
				
			
					productBean.setName(name);
					productBean.setPrice(price);
					productBean.setEvent(event);
					productBean.setGender(gender);
					productBean.setAge(age);
					productBean.setInventory(inventory);
					productBean.setContent(content);
					productBean.setFilename(filename);
					productBean.setDate(new Timestamp(System.currentTimeMillis()));
					
					productService.updatePro(num,productBean);
					
					nextPage = "/product/viewDetail.do?num="+num;
				}else if (action.equals("/viewPro.do")){
					String filename = request.getParameter("filename");
					productBean  = new ProductBean();
					productBean = productService.getPro(filename);
					int num = productBean.getNum();
					request.setAttribute("productDetail", productBean);
					nextPage = "/category/viewDetail.jsp";
				}else if(action.equals("/buyProduct.do")){  //�긽�꽭 �럹�씠吏��뿉�꽌 援щℓ�뻽�쓣 寃쎌슦
					
					String id = request.getParameter("id");
					int num = Integer.parseInt(request.getParameter("num"));
					int count = Integer.parseInt(request.getParameter("count"));
					productBean = new ProductBean();
					productBean = productService.getProductInfo(num);
					CouponList = couponDAO.getCouponList(id);
					request.setAttribute("CouponList", CouponList);
					request.setAttribute("orderList", productBean);
					request.setAttribute("count", count);
					nextPage = "/pro/orderProduct.jsp";
				}			
				else if(action.equals("/buyCartProduct.do")) { //移댄듃�뿉�꽌 援щℓ�뻽�쓣 寃쎌슦
					ArrayList<cartBean> cArr = new ArrayList<cartBean>();
					String [] num = request.getParameterValues("cartDelList"); // 移댄듃�뿉�꽌 �꽆踰꾨뱾�쓣 媛�吏�怨좎샂
					for(int i=0; i < num.length; i++) { 
						cartBean bean = cartService.getCartInfo(Integer.parseInt(num[i]));
						cArr.add(bean);
					}
					String id = request.getParameter("id");
					CouponList = couponDAO.getCouponList(id);
					request.setAttribute("CouponList", CouponList);
					request.setAttribute("orderCartList", cArr);
					nextPage = "/pro/orderCart.jsp";
				}
			/* category.jsp�뿉�꽌 �벑濡앹씪�닚�쑝濡� �긽�뭹�젙�젹 */
				 else if(action.equals("/datesearch.do")){
					 	List<ProductBean> date_list = new ArrayList<ProductBean>();
					 	ProductDAO pdao = new ProductDAO();
					 	date_list=pdao.getListDate();
						request.setAttribute("productList", date_list);	
						request.setAttribute("action", action);	
						nextPage = "/category/category.jsp";
			         }
	/* category.jsp�뿉�꽌 �벑濡앹씪�닚�쑝濡� �긽�뭹�젙�젹 */
				
				
	/* category.jsp�뿉�꽌 由щ럭�닚�쑝濡� �긽�뭹�젙�젹 */
				else if(action.equals("/reviewsearch.do")){
					 	List<ProductBean> review_list = new ArrayList<ProductBean>();
					 	ProductDAO pdao = new ProductDAO();
					 	
					 	review_list=pdao.getListReview_count();
						request.setAttribute("productList", review_list);
						request.setAttribute("action", action);
						
						nextPage = "/category/category.jsp";
			         }
	/* category.jsp�뿉�꽌 由щ럭�닚�쑝濡� �긽�뭹�젙�젹 */
				
	/* category.jsp�뿉�꽌 �씤湲곗닚�쑝濡� �긽�뭹�젙�젹 */
				else if(action.equals("/popsearch.do")){
					 	List<ProductBean> pop_list = new ArrayList<ProductBean>();
					 	ProductDAO pdao = new ProductDAO();
					 	
					 	pop_list=pdao.getListPop_count();
						request.setAttribute("productList", pop_list);
						request.setAttribute("action", action);
						
						nextPage = "/category/category.jsp";
			         }
	/* category.jsp�뿉�꽌 �씤湲곗닚�쑝濡� �긽�뭹�젙�젹 */

			RequestDispatcher dis = request.getRequestDispatcher(nextPage);
			dis.forward(request, response);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String> productMap = new HashMap<String, String>();
		String path = request.getRealPath("/upload");
		String encoding = "UTF-8";

		File currentDirPath = new File(path);

		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setSizeThreshold(1 * 1024 * 1024);

		factory.setRepository(currentDirPath);

		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			List items = upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + " : " + fileItem.getString(encoding));

					productMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("占식띰옙占쏙옙拷占� :" + fileItem.getFieldName());
					System.out.println("占쏙옙占싹몌옙 : " + fileItem.getName());
					System.out.println("크占쏙옙 : " + fileItem.getSize());

					productMap.put(fileItem.getFieldName(), fileItem.getName());

					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}

						String fileName = fileItem.getName().substring(idx + 1);

						File uploadFile = new File(currentDirPath + "\\" + fileName);

						fileItem.write(uploadFile);
					}

				}
			}

		} catch (Exception e) {
			System.out.println("error map" + e);
		}

		return productMap;
	}

	private Map<String, String> review_upload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("review error");
		Map<String, String> reviewMap = new HashMap<String, String>();
		String path = request.getRealPath("/review_upload");
		String encoding = "UTF-8";

		File currentDirPath = new File(path);

		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setSizeThreshold(1 * 1024 * 1024);

		factory.setRepository(currentDirPath);

		ServletFileUpload review_upload = new ServletFileUpload(factory);

		try {
			List items = review_upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + " : " + fileItem.getString(encoding));

					reviewMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("�븘�뱶紐� : " + fileItem.getFieldName());
					System.out.println("�뙆�씪紐� : " + fileItem.getName());

					reviewMap.put(fileItem.getFieldName(), fileItem.getName());

					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}

						String fileName = fileItem.getName().substring(idx + 1);

						File uploadFile = new File(currentDirPath + "\\" + fileName);

						fileItem.write(uploadFile);
					}
				}
			}
		} 
		catch (Exception e) {
			System.out.println("error map" + e);
		}

		return reviewMap;
	}

}