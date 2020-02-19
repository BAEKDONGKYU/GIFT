package coupon;

import java.sql.Timestamp;

public class ListCouponBean {
	
	private int num;
	private String subject;
	private String content;
	private int multi;
	private int price;
	private Timestamp day1;
	private Timestamp day2;
	private int percent;
	private int after;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMulti() {
		return multi;
	}
	public void setMulti(int multi) {
		this.multi = multi;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getDay1() {
		return day1;
	}
	public void setDay1(Timestamp day1) {
		this.day1 = day1;
	}
	public Timestamp getDay2() {
		return day2;
	}
	public void setDay2(Timestamp day2) {
		this.day2 = day2;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getafter() {
		return after;
	}
	public void setafter(int after) {
		this.after = after;
	}

}
