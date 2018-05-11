package vo;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String email;
	private String phone;
	private int pallowerNum;
	private int pallowingNum;
	
	public UserVO() {
		
	}

	public UserVO(String id, String pw, String name, String gender, String email, String phone, int pallowerNum,
			int pallowingNum) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.pallowerNum = pallowerNum;
		this.pallowingNum = pallowingNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPallowerNum() {
		return pallowerNum;
	}

	public void setPallowerNum(int pallowerNum) {
		this.pallowerNum = pallowerNum;
	}

	public int getPallowingNum() {
		return pallowingNum;
	}

	public void setPallowingNum(int pallowingNum) {
		this.pallowingNum = pallowingNum;
	}
}
