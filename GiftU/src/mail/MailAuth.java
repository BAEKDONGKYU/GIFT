package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "giftyou940@gmail.com";  //관리자 이메일
        String mail_pw = "admin940!!";  // 관리자 비밀번호
        
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
