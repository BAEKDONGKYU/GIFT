package category;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import product.ProductBean;







public class CategoryDAO {
	
	private static SqlSessionFactory sqlMapper = null;
		
		public static SqlSessionFactory getInstance(){
			
			if(sqlMapper == null){
				
				try {
					
					String resource = "mybatis/SqlMapConfig.xml";
					
					Reader reader = Resources.getResourceAsReader(resource);
					
					sqlMapper = new SqlSessionFactoryBuilder().build(reader);
					
					reader.close();
					
				} catch (Exception e) {
					
					e.printStackTrace();				
				}			
			}		
			return sqlMapper;		
		}
				

		
		public List selectProductByCtegory(ProductBean pbean){
			sqlMapper = getInstance();
			
			SqlSession session = sqlMapper.openSession();				
			
			List list = session.selectList("mapper.product.selectProductByCtegory", pbean);
			
			return list;
									
		}



		
		
}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

