package history;

import java.util.ArrayList;

public class HistoryService {
	HistoryDAO dao;
	
	public HistoryService() {
		dao = new HistoryDAO();
	}
	
	// 해당 아이디의 모든 주문 내역 가져오기
	public ArrayList<HistoryBean> allPaymentHistory(String id) {
		return dao.getAllPaymentHistory(id);
	}
	
	// 해당 아이디의 최근 1개월 주문 내역 가져 오기
	public ArrayList<HistoryBean> oneMonthPaymentHistory(String id) {
		return dao.getOneMonthPaymentHistory(id);
	}
	// 해당 아이디의 최근 3개월 주문 내역 가져 오기
	public ArrayList<HistoryBean> threeMonthsPaymentHistory(String id) {
		return dao.getThreeMonthsPaymentHistory(id);
	}
	
	// 해당 아이디의 최근 6개월 주문 내역 가져 오기
	public ArrayList<HistoryBean> sixMonthsPaymentHistory(String id) {
		return dao.getSixMonthsPaymentHistory(id);
	}
	
	// 해당 아이디의 지정한 날짜 주문 내역 가져 오기
	public ArrayList<HistoryBean> betweenMonthsPaymentHistory(String id,String startDate,String endDate) {
		return dao.getBetweenPaymentHistory(id,startDate,endDate);
	}
	
	// 테이블의 최신 주문 번호 가져오기
	
	public String selectOrderNumber() {
		return dao.selectOrderNumber();
	}
	
	public int insertPaymentHistory(HistoryBean bean) {
		return dao.insertPaymentHistory(bean);
	}
	
}
