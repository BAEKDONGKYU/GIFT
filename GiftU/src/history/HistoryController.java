package history;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.cartBean;
import product.ProductService;



@WebServlet("/history/*")
public class HistoryController extends HttpServlet{

	HistoryService service;
	ProductService pService;
	
	@Override
	public void init() throws ServletException {
		System.out.println("init()메소드 실행");
		service = new HistoryService();
		pService = new ProductService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()메소드 실행");
		doHandle(request,response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()메소드 실행");
		doHandle(request,response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action은 " + action);
		ArrayList<HistoryBean> historyArray;
		String nowBlock = request.getParameter("nowBlock");
		String nowPage = request.getParameter("nowPage");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		System.out.println("nowBlock은"+nowBlock);
		System.out.println("nowPage은"+nowPage);
		System.out.println("startDate는" + startDate);
		System.out.println("endDate는" + endDate);
		
		if(action.equals("/searchHistory.do")) {
			if(nowBlock == null) {
				request.setAttribute("nowBlock", 0);
			}
			if(nowBlock != null) {
				request.setAttribute("nowBlock", nowBlock);
			}
			
			if(nowPage == null) {
				request.setAttribute("nowPage", 0);
			}
			
			if(nowPage != null) {
				request.setAttribute("nowPage", nowPage);
			}
			
			
			String id = (String)request.getSession().getAttribute("id");
			System.out.println("id는"+id);
			String month = request.getParameter("month");
			if(month == null) {
				month = "three";
			}
			request.setAttribute("month", month);
			if(month.equals("all")) {
				historyArray = service.allPaymentHistory(id);
				request.setAttribute("history", historyArray);
				System.out.println("month는 " + month);
			}
			else if(month.equals("one")) {
				historyArray = service.oneMonthPaymentHistory(id);
				request.setAttribute("history", historyArray);
			}
			else if(month.equals("three")) {
				historyArray = service.threeMonthsPaymentHistory(id);
				request.setAttribute("history", historyArray);
			}else if(month.equals("six")) {
				historyArray = service.sixMonthsPaymentHistory(id);
				request.setAttribute("history", historyArray);
			}else if(month.equals("between")) {
				request.setAttribute("startDate",startDate);
				request.setAttribute("endDate", endDate);
				historyArray = service.betweenMonthsPaymentHistory(id, startDate, endDate);
				request.setAttribute("history", historyArray);
			}
			nextPage = "/pro/paymentHistory.jsp";
		} // end search.do
		
		
		// 장바구니에서 거래 성공 했을 경우
		else if(action.equals("/insertCartHistory.do")) {
			
			//구매한 상품의 종류의 수를 가져옴
			int fcount = Integer.parseInt(request.getParameter("fcount"));
			
			// 상품의 개수만큼 반복문 돌면서  상품 DB에서 해당 상품의 팔린 수와 재고량을 업데이트 시켜준다.
			
			for(int i=0; i<fcount; i++) {
				String productName = request.getParameter("pname"+i);
				int sell = Integer.parseInt(request.getParameter("pcount"+i));
				pService.updateInventory2(sell, productName);
				if(i+1 == fcount) {
					break;
				}
			}
			
			
			//구매 내역에 추가
			String phone = request.getParameter("phone1")
					+"-"+request.getParameter("phone2")+"-"
					+request.getParameter("phone3"); // 구매자 휴대폰 번호
			
			String orderNumber = service.selectOrderNumber();
			if(orderNumber == null) {
				// 구매내역을 111111로 초기화
				orderNumber = "11111111";
			}
			//구매내역 테이블에 최신 구매내역 번호가 있을 경우
			else {
				//최신 구매내역 번호에서 +1을 해주고 
				int temp = Integer.parseInt(orderNumber)+1;
				//주문번호를 다시 저장
				orderNumber = Integer.toString(temp);
			}
			
			HistoryBean bean = new HistoryBean();
			bean.setPostcode(request.getParameter("postcode")); //우편번호
			bean.setAddress(request.getParameter("address")); //주소
			bean.setDetail_address(request.getParameter("detailAddress")); //구매자 상세 주소
			bean.setCount(1); // 상품 구매 개수
			bean.setDelivery("배송중"); // 배송상태 
			bean.setEmail(request.getParameter("email")); //구매자 이메일
			bean.setFilename(request.getParameter("filename0"));// 구매한 상품 이미지
			bean.setMsg(request.getParameter("msg")); // 배송시 요청한 메세지
			bean.setName(request.getParameter("name")); //구매자 이름
			bean.setAll_price(Integer.parseInt(request.getParameter("allPrice"))); //배송비 포함 총 가격
			bean.setId(request.getParameter("id")); //구매자 id
			bean.setPhone(phone); //구매자 휴대폰 번호
			bean.setOrder_number(orderNumber); // 주문번호
			bean.setPayment_type(request.getParameter("paymentType")); // 구매 방식 
			bean.setProduct_name(request.getParameter("productName")); // 구매한 상품명
			
			int price = 0;
			String etc = "";
			for(int i=0; i<fcount; i++) {
				price = price + Integer.parseInt(request.getParameter("price"+i));
				etc = etc + request.getParameter("pname"+i)+","+request.getParameter("pcount"+i)+"개" ;
			}
			bean.setPrice(price); // 상품 단가
			bean.setEtc(etc); // 각각 상품한 이름과 개수
			
			
			int result = service.insertPaymentHistory(bean);
			
			if(result == 1) {
				request.setAttribute("bean", bean);
				nextPage = "/member/sendPaymentEmail.do";				
			}
		}
		
		
		// 상세보기에서 구매 버튼 눌렀을 경우(단품)
		else if(action.equals("/insertHistory.do")) {
			
			
			int num = Integer.parseInt(request.getParameter("num"));
			String phone = request.getParameter("phone1")
					+"-"+request.getParameter("phone2")+"-"
					+request.getParameter("phone3"); // 구매자 휴대폰 번호
			
			String orderNumber = service.selectOrderNumber(); // 구매내역 테이블에서 최신 주문번호 가져오기
			//구매 내역 테이블에 최신 구매내역 번호가 없을 경우
			if(orderNumber == null) {
				// 구매내역을 111111로 초기화
				orderNumber = "11111111";
			}
			//구매내역 테이블에 최신 구매내역 번호가 있을 경우
			else {
				//최신 구매내역 번호에서 +1을 해주고 
				int temp = Integer.parseInt(orderNumber)+1;
				//주문번호를 다시 저장
				orderNumber = Integer.toString(temp);
			}
			HistoryBean bean = new HistoryBean();
			bean.setPostcode(request.getParameter("postcode")); //우편번호
			bean.setAddress(request.getParameter("address")); //주소
			bean.setDetail_address(request.getParameter("detailAddress")); //구매자 상세 주소
			bean.setCount(Integer.parseInt(request.getParameter("count"))); // 상품 구매 개수
			bean.setDelivery("배송중"); // 배송상태 
			bean.setEmail(request.getParameter("email")); //구매자 이메일
			bean.setFilename(request.getParameter("filename"));// 구매한 상품 이미지
			bean.setMsg(request.getParameter("msg")); // 배송시 요청한 메세지
			bean.setName(request.getParameter("name")); //구매자 이름
			bean.setAll_price(Integer.parseInt(request.getParameter("allPrice"))); //배송비 포함 총 가격
			bean.setId(request.getParameter("id")); //구매자 id
			bean.setPhone(phone); //구매자 휴대폰 번호
			bean.setOrder_number(orderNumber); // 주문번호
			bean.setPayment_type(request.getParameter("paymentType")); // 구매 방식 
			bean.setProduct_name(request.getParameter("productName")); // 구매한 상품명
			bean.setPrice(Integer.parseInt(request.getParameter("price"))); // 상품 단가
			
			int result = service.insertPaymentHistory(bean);
			if(result == 1) {
				//상품 테이블의 재고량과 팔린 수량을 변경 해주기
				int updateResult = pService.updateInventory(bean.getCount(),num);
				if(updateResult == 1) {
					//팔린 상품에 대한 이메일 전송
					request.setAttribute("bean", bean);
					nextPage = "/member/sendPaymentEmail.do";	
				}			
				/*System.out.println("구매내역에 추가 했습니다.");
				nextPage = "/pro/paymentHistory.jsp";*/
			}
			
			else  {
				System.out.println("구매내역 추가 실패 했습니다.");
				nextPage = "/pro/paymentHistory.jsp";
			}
		
		}
		
		if(nextPage != "") {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	} // end doHandle
	
}
