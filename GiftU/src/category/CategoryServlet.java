package category;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import product.ProductBean;

@WebServlet("/category.do")
public class CategoryServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doHandle(request, response);		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
		
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		CategoryDAO cdao = new CategoryDAO();
		
		ProductBean productBean = new ProductBean();
		
		String jsonInfo = request.getParameter("jsonInfo");
		String id = request.getParameter("id");
		
		
		try {
			JSONParser jsonParser = new JSONParser();

			
			
			JSONObject jsonObject = (JSONObject)jsonParser.parse(jsonInfo); //��ĳ���� + �ٿ�ĳ������ ���ÿ�
			
			
			Map<String, String> map = new HashMap<String, String>();
				map.put("gender",(String)jsonObject.get("gender"));
				map.put("event",(String)jsonObject.get("event"));
				map.put("age", (String)jsonObject.get("age"));
				map.put("price", (String)jsonObject.get("price"));
				map.put("id", request.getParameter("id"));
				
				
				System.out.println(map.get("gender"));
				System.out.println(map.get("event"));
				System.out.println(map.get("age"));
				System.out.println(map.get("price"));
				System.out.println(map.get("id"));
				
				
				if(map.get("age").equals("undefined")){
					map.put("age", "1");
				}
				
				if(map.get("price").equals("undefined")){
					map.put("price", "1");
				}
				
				
				productBean.setGender(map.get("gender"));
				productBean.setEvent(map.get("event"));
				productBean.setAge(Integer.parseInt(map.get("age")));
				productBean.setPrice(Integer.parseInt(map.get("price")));

				
				List productList = cdao.selectProductByCtegory(productBean);					
				
				request.setAttribute("productList", productList);
				DecimalFormat df = new DecimalFormat("#,###") ;
				
				String result = null;
				
				result="<main>";
				
			for(int i=0; i<productList.size(); i++){
					
				ProductBean pbean = (ProductBean)productList.get(i);
					
					String name = pbean.getName();
					int num = pbean.getNum();
					String filename = pbean.getFilename();
					int price = pbean.getPrice();
					String event=pbean.getEvent();
					
					
					result +=	"<product>"
							+ "<filename>"+filename+"</filename>"
							+ "<num>"+num+"</num>"
							+ "<price>"+df.format(price)+"</price>"
							+ "<name>"+name+"</name>"
							+ "<event>"+event+"</event>"
							+ "</product>";
					
					System.out.println(num);								
				
			}			
			
			response.setContentType("text/html;charset=UTF-8");
			
			result +="<id>"+id+"</id>"
					+"</main>";
					
			System.out.println(id);
			
			PrintWriter writer = response.getWriter();
			
			
			
				if(productList.size()==0){
					result = null;
					
				}
				writer.print(result);
				
				
				
				
				
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
}	
		
		
