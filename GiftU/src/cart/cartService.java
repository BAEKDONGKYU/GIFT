package cart;

import java.util.ArrayList;
import java.util.List;

import product.ProductBean;

public class cartService {
	cartDAO dao;
	
	public cartService() {
		dao = new cartDAO();
	}
	
	public void addCart(cartBean bean,int num){
		System.out.println("sadsadsad");
		dao.insertCart(bean,num);
	}

	public List<cartBean> getCartList(String id,int kind) {
		List<cartBean> list = new ArrayList<cartBean>();
	 	list =  dao.getCartList(id,kind);
		return list;
	}

	public void delList(int num) {
		dao.delList(num);
	}

	public int getAmount(String id,int kind) {
		int amount = dao.getAmount(id,kind);
		return amount;
	}

	public void modCart(int num,int count) {
		dao.modCart(num,count);
		
	}

	public List<cartBean> getHeartList(String id,int kind) {
		List<cartBean> list = new ArrayList<cartBean>();
		list = dao.getHeartList(id,kind);
		return list;
	}

	public void delHeartList(int num, int obj) {
		dao.delHeartList(num,obj);
	}

	public cartBean getCartInfo(int num) {
		return dao.getCartInfo(num);
	}
}
