package member;

public class MemberBean {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String tel;
	private String tel_2;
	private String address;
	private String address_2;
	private String address_3;

	private String dday_1, ddate_1;
	private String dday_2, ddate_2;
	private String dday_3, ddate_3;

	public MemberBean() {
	}

	public MemberBean(String id, String pass, String name, String email, String address, String address_2,
			String address_3, String tel, String tel_2, String dday_1, String ddate_1, String dday_2, String ddate_2,
			String dday_3, String ddate_3) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.tel_2 = tel_2;
		this.address = address;
		this.address_2 = address_2;
		this.address_3 = address_3;
		this.dday_1 = dday_1;
		this.ddate_1 = ddate_1;
		this.dday_2 = dday_2;
		this.ddate_2 = ddate_2;
		this.dday_3 = dday_3;
		this.ddate_3 = ddate_3;
	}

	// getter & setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel_2() {
		return tel_2;
	}

	public void setTel_2(String tel_2) {
		this.tel_2 = tel_2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_2() {
		return address_2;
	}

	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}

	public String getAddress_3() {
		return address_3;
	}

	public void setAddress_3(String address_3) {
		this.address_3 = address_3;
	}

	public String getDday_1() {
		return dday_1;
	}

	public void setDday_1(String dday_1) {
		this.dday_1 = dday_1;
	}

	public String getDdate_1() {
		return ddate_1;
	}

	public void setDdate_1(String ddate_1) {
		this.ddate_1 = ddate_1;
	}

	public String getDday_2() {
		return dday_2;
	}

	public void setDday_2(String dday_2) {
		this.dday_2 = dday_2;
	}

	public String getDdate_2() {
		return ddate_2;
	}

	public void setDdate_2(String ddate_2) {
		this.ddate_2 = ddate_2;
	}

	public String getDday_3() {
		return dday_3;
	}

	public void setDday_3(String dday_3) {
		this.dday_3 = dday_3;
	}

	public String getDdate_3() {
		return ddate_3;
	}

	public void setDdate_3(String ddate_3) {
		this.ddate_3 = ddate_3;
	}

}
