package chapter07;

public class LoginCons {
	int index;
	private String userName;
	private String userId;
	private String userPassword;
	boolean isLogin;
	
	public LoginCons(int index, String userName,
			String userId, String userPassword, boolean isLogin) {
		this.index = index;
		this.userName = userName;
		this.userId = userId;
		this.userPassword = userPassword;
		this.isLogin = isLogin;
	}
	
	@Override
	public String toString() {
		return "LoginCons [index= " + index + ", userName= " + userName +
				", userId= " + userId + ", userPassword= " + userPassword + ", isLogin= " + isLogin + "]";
	}
	
	public static void main(String[] args) {
		LoginCons log1 = new LoginCons(1, "김자바", "javakim123", "javakimpassword!", true);
		System.out.println(log1.toString());
	}

}
