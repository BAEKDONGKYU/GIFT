package product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.BoardBean;
import product_comment.Product_commentBean;
import product_comment.Product_commentDAO;



public class ProductService {
	ProductDAO dao;
	Product_commentDAO cdao;
	
	public ProductService() {
		dao = new ProductDAO();
		cdao=new Product_commentDAO();
	}
	
	
	public Map listProducts(Map<String,Integer> pageMap){
		List<ProductBean> listProducts = new ArrayList<ProductBean>();
		Map proMap = new HashMap();
		listProducts = dao.getListProducts(pageMap);
		proMap.put("listProducts", listProducts);
		return proMap;
	}
	
	
	public void addProduct(ProductBean bean){
		dao.addProduct(bean);
	}

	
	public ProductBean getProduct(int num) {
		ProductBean productBean = dao.getDetail(num);
		
		return productBean;
	}
	
	public int countComment(int num){
		int count = cdao.getCommentCount(num);
		return count;
	}
	
	public int countComment_r(int num){
		int count_r = cdao.getCommentCount_r(num);
		return count_r;
	}
	public int countComment_c(int num){
		int count_c = cdao.getCommentCount_c(num);
		return count_c;
	}
	
	public int sumStar(int num){
		int star = cdao.getSumstar(num);
		return star;
	}
	
	public List<Product_commentBean> listComments(int startRow, int pageSize,int num) {
		List<Product_commentBean> clist = cdao.getCommentList(startRow, pageSize,num);
		return clist;
	}
	
	public List<Product_commentBean> listComments_r(int startRow, int pageSize,int num) {
		List<Product_commentBean> clist_r = cdao.getCommentList_r(startRow, pageSize,num);
		return clist_r;
	}
	
	
	public List<Product_commentBean> listComments_c(int num) {
		List<Product_commentBean> clist_c = cdao.getCommentList_c(num);
		return clist_c;
	}
	
	public List<Product_commentBean> listComments_d(int num) {
		List<Product_commentBean> clist_d = cdao.getCommentList_d(num);
		return clist_d;
	}
	
	/*일반 댓글 수정 삭제*/
	public Product_commentBean commentUpdate(int num,int num_c){
		Product_commentBean comment = null;
		comment = cdao.getComment(num,num_c);
		
		return comment;
	}
	
	public void updateComment(Product_commentBean cbean,int num,int num_c){
		cdao.updateComment(cbean,num,num_c);
	}
	public List<ProductBean> event_p(int startRow, int pageSize,String event) {
		List<ProductBean> list_e = dao.event_p(startRow, pageSize,event);
		return list_e;
	}
	public void delComment(int num,int num_c){
		cdao.delComment(num,num_c);
	}
	public void delComment_double(int num,int num_c){
		cdao.delComment_double(num,num_c);
	}
	/*사진 리뷰 수정 삭제*/
	public Product_commentBean reviewUpdate(int num,int num_c){
		Product_commentBean review = null;
		review = cdao.getReview(num,num_c);
		
		return review;
	}
	
	public int countComment_e(String event){ //관련 상품갯수
		int count_e = dao.getCommentCount_e(event);
		return count_e;
	}
	
	public void updateReview(Product_commentBean cbean,int num,int num_c){
		cdao.updateReview(cbean,num,num_c);
	}
	
	public void delReview(int num,int num_c){
		cdao.delReview(num,num_c);
	}
	
	public void delReview_m(int num,int num_c){
		cdao.delReview_m(num,num_c);
	}
	
	public void delReview_d(int num,int num_c){
		cdao.delReview_d(num,num_c);
	}
	public void delProduct(int num){
		dao.delProduct(num);
	}


	public int getTotalProduct() {
		int total = dao.TotalProduct();
		return total;
	}


	public ProductBean getProductInfo(int num) {
		ProductBean bean = dao.getProduct(num);
		return bean;
	}

	public void updatePro(int num, ProductBean productBean) {
		dao.updatePro(num,productBean);
	}

	public List<ProductBean> getTopPro() {
		List<ProductBean> list = dao.getTopPro();
		return list;
	}

	public ProductBean getPro(String filename) {
		ProductBean bean = dao.getPro(filename);
		return bean;
	}
	
	public int updateInventory(int sell ,int num) {
		return dao.updateInventory(sell,num);
	}
	
	public int updateInventory2(int sell, String productName) {
		return dao.updateInventory2(sell, productName);
	}
	
	
}
