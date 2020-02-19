package coupon;

import java.sql.Timestamp;

public class PointBean {
	
	private int num;
	private String id;
	private String betwen;
	private int point;
	private Timestamp day;
	private String content;
	private int total;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBetwen() {
		return betwen;
	}
	public void setBetwen(String betwen) {
		this.betwen = betwen;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
