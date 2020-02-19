package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import history.HistoryBean;
import member.MemberDAO;



public class MailSend {
	
	MimeMessage msg;
	
	
	public MailSend() {
		 Properties prop = System.getProperties();
	     prop.put("mail.smtp.starttls.enable", "true");  // 로그인시 TLS를 사용할 것인지 설정
	     prop.put("mail.smtp.host", "smtp.gmail.com");  //이메일 발송을 처리해줄 SMTP서버
	     prop.put("mail.smtp.auth", "true"); //- SMTP 서버의 인증을 사용한다는 의미
	     prop.put("mail.smtp.port", "587"); //- TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
	     Authenticator auth = new MailAuth();  //- MailAuth.java 에서 Authenticator를 상속받아 생성한 MailAuth 클래스를 받아 세션을 생성한다.
	     Session session = Session.getDefaultInstance(prop, auth); //세션을 생성할때 설정할 환경과 계정정보
	     msg = new MimeMessage(session);  //MimeMessage는 Message (추상)클래스를 상속받은 인터넷 메일을 위한 클래스이다. 
	        											 //위에서 생성한 세션을 담아 msg 객체를 생성한다
	}
		 
	public int findID(String email) {
		
		//DAO에 접속해서 해당 이메일에 아이디를 찾아서 가져온다.
		MemberDAO dao = new MemberDAO();
		String id = dao.findId(email);
		int result = 0; // 메일이 정상적으로 전송 여부를 확인해주는 변수
		 try {
	            msg.setSentDate(new Date()); // 보내는 날짜 지정
	            msg.setFrom(new InternetAddress("giftyou940@gmail.com", "administrator")); //setForm 메소드를 사용하여 송자의 메일, 발송자명
	            															//InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
	            InternetAddress to = new InternetAddress(email);       //수신자의 메일을 생성한다.   
	            msg.setRecipient(Message.RecipientType.TO, to);    
	            msg.setSubject("giftU 고객센터 입니다. ", "UTF-8");     // 메일의 제목 지정         
	            msg.setText("안녕하세요  giftU을 사랑해주셔서 감사합니다. \n "
	            		+"고객님이 찾으시는 ID는 "+ id + "입니다. \n"
	            				+ "앞으로도 많은 이용 부탁드립니다. 감사합니다~!!", "UTF-8");     //메일의 내용 입력         
	            
	            Transport.send(msg); // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분
	            result = 1;
	        } 
		 	catch(AddressException ae) {            
	            System.out.println("AddressException : " + ae.getMessage());           
	        } 
		 	catch(MessagingException me) {            
	            System.out.println("MessagingException : " + me.getMessage());
	        } 
		 	catch(UnsupportedEncodingException e) {
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }
	      
		 return result;
	}
	
	
	public int findPW(String id, String email, String pw) {
		
		int result = 0; // 메일이 정상적으로 전송 여부를 확인해주는 변수
			try {
				
				msg.setSentDate(new Date()); // 보내는 날짜 지정
				msg.setFrom(new InternetAddress("giftyou940@gmail.com", "administrator")); //setForm 메소드를 사용하여 송자의 메일, 발송자명
				//InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
				InternetAddress to = new InternetAddress(email);       //수신자의 메일을 생성한다.   
				msg.setRecipient(Message.RecipientType.TO, to);    
				msg.setSubject("giftU 고객센터 입니다.", "UTF-8");     // 메일의 제목 지정         
				msg.setText("안녕하세요 giftU을 사랑해주셔서 감사합니다. \n "
						+ id + "님의 비밀번호는 " +pw+"입니다. \n"
						+ "앞으로도 많은 이용 부탁드립니다. 감사합니다~!!", "UTF-8");     //메일의 내용 입력         
				
				Transport.send(msg); // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분
				result = 1;
			} 
			catch(AddressException ae) {            
				System.out.println("AddressException : " + ae.getMessage());           
			} 
			catch(MessagingException me) {            
				System.out.println("MessagingException : " + me.getMessage());
			} 
			catch(UnsupportedEncodingException e) {
				System.out.println("UnsupportedEncodingException : " + e.getMessage());			
			}
			
			return result;
	
	} //method end
	
	
	public int sendMail(String name, String from, String to, String subject, String message) {
		int result = 0; // 메일이 정상적으로 전송 여부를 확인해주는 변수
		try {
			msg.setSubject(name+"("+ from +")" + "님으로 부터 송신: " + subject, "UTF-8");//제목

			Address fromAddr = new InternetAddress(from); 

			msg.setFrom(fromAddr);//보내는 사람
			
			
			Address toAddr = new InternetAddress(to); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);//받는 사람
			
			
			msg.setContent(message, "text/html; charset=UTF-8");//내용과 인코딩
			
			Transport.send(msg); // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분
			result = 1;
		} 
		catch(AddressException ae) {            
			System.out.println("AddressException : " + ae.getMessage());           
		} 
		catch(MessagingException me) {            
			System.out.println("MessagingException : " + me.getMessage());
		}
		return result;
	}
	
	
	public int paymentEmail(HistoryBean bean) {
		int result = 0; // 메일이 정상적으로 전송 여부를 확인해주는 변수
		try {
			msg.setSentDate(new Date()); // 보내는 날짜 지정
			msg.setFrom(new InternetAddress("giftyou940@gmail.com", "administrator")); //setForm 메소드를 사용하여 송자의 메일, 발송자명
			//InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
			InternetAddress to = new InternetAddress(bean.getEmail());       //수신자의 메일을 생성한다.   
			msg.setRecipient(Message.RecipientType.TO, to);    
			msg.setSubject("giftU 고객센터 입니다.", "UTF-8");     // 메일의 제목 지정  
			msg.setText("안녕하세요 giftU을 사랑해주셔서 감사합니다. \n "
					+ bean.getId() + "님이 구매하신 상품은 " + bean.getProduct_name()+"입니다. \n"
					+ "주문번호는 " + bean.getOrder_number() + "이며  \n"
					+"수량은 " +bean.getCount()+"개 " +"배송비를 포함한 총 가격은 " + bean.getAll_price()+"입니다.\n" 
					+"앞으로도 많은 이용 부탁드립니다. 감사합니다~!!", "UTF-8");     //메일의 내용 입력         
			
			Transport.send(msg); // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분
			result = 1;
		} 
		catch(AddressException ae) {            
			System.out.println("AddressException : " + ae.getMessage());           
		} 
		catch(MessagingException me) {            
			System.out.println("MessagingException : " + me.getMessage());
		} 
		catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());			
		}
		
		return result;
	}
	
	
	
		
}
