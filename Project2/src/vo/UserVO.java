package vo;

public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userGender;
	private int userBirth;
	private String userNicName;
	private String userAddress;
	private String userEmail;
	private String userPhone;
	private int userFollower;
	private int userFollowing;
	private String userImg;
	private String userBio;
	
	public UserVO() {
		
	}

	
	
	
	public UserVO(String userId, String userPw, String userName, String userGender, int userBirth, String userNicName,
			String userAddress, String userEmail, String userPhone, int userFollower, int userFollowing, String userImg,
			String userBio) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userNicName = userNicName;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userFollower = userFollower;
		this.userFollowing = userFollowing;
		this.userImg = userImg;
		this.userBio = userBio;
	}

	



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserNicName() {
		return userNicName;
	}

	public void setUserNicName(String userNicName) {
		this.userNicName = userNicName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getUserFollower() {
		return userFollower;
	}

	public void setUserFollower(int userFollower) {
		this.userFollower = userFollower;
	}

	public int getUserFollowing() {
		return userFollowing;
	}

	public void setUserFollowing(int userFollowing) {
		this.userFollowing = userFollowing;
	}




	public String getUserImg() {
		return userImg;
	}




	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}




	public String getUserBio() {
		return userBio;
	}




	public void setUserBio(String userBio) {
		this.userBio = userBio;
	}
	
	
	
}
