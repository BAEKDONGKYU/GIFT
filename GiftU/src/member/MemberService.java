package member;

import java.util.List;

import history.HistoryBean;
import mail.MailSend;

public class MemberService {
	MemberDAO memberDAO;
	MailSend ms = new MailSend();

	public MemberService() {
		memberDAO = new MemberDAO();
	}

	public int checkUser(String id, String pass) {
		return memberDAO.userCheck(id, pass);
	}

	public int findEmail(String email) {
		return memberDAO.findEmail(email);
	}

	public int sendIdEmail(String email) {
		return ms.findID(email);
	}

	public String findPw(String id) {
		return memberDAO.findPw(id);
	}

	public int sendPwEmail(String id, String email, String pw) {
		return ms.findPW(id, email, pw);
	}

	public String getEmail(String id) {
		return memberDAO.getEmail(id);
	}
	
	
	public int sendPaymentEmail(HistoryBean bean) {
		return ms.paymentEmail(bean);
	}
	
	public List<MemberBean> getMemberInfo(String id) {
		return memberDAO.listMembers(id);
	}

}
