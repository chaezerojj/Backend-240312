package chapter07;

public class LoginGS {
	int index;
	private String userName;
	private String userId;
	private String userPassword;
	boolean isLogin;
	
	
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public boolean isLogin() {
		return isLogin;
	}
	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}
	
	@Override
	public String toString() {
		return "LoginGS [index= " + index + ", userName= " + userName +
				", userId= " + userId + ", userPassword= " + userPassword + ", isLogin= " + isLogin + "]";
	}
	public static void main(String[] args) {
		LoginGS log1 = new LoginGS();
		log1.setIndex(1);
		log1.setUserName("이자바");
		log1.setUserId("leejava001");
		log1.setUserPassword("password123!");
		log1.setLogin(false);
		System.out.println(log1.toString());
	}

}
