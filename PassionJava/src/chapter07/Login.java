package chapter07;

// 로그인 프로그램
public class Login {
	int index;
	private String userName;
	private String userId;
	private String userPassword;
	boolean isLogin;
	
	public void setLogin(int i, String n, String id, String pw, boolean is) {
		index = i;
		userName = n;
		userId = id;
		userPassword = pw;
		isLogin = is;
	}
	
	public void getLogin() {
		System.out.println("인덱스: " + index);
		System.out.println("사용자 이름: " + userName);
		System.out.println("아이디: " + userId);
		System.out.println("비밀번호: " + userPassword);
		System.out.println("로그인유무: " + isLogin);
		System.out.println();
	}
	
	public static void main(String[] args) {
		System.out.println("<<<< 사용자 db >>>>");
		Login login1 = new Login();
		login1.setLogin(1, "김자바", "kim01", "kim01password", false);
		login1.getLogin();
		
		Login login2 = new Login();
		login2.setLogin(2, "홍길동", "hong02", "hong02password", true);
		login2.getLogin();
	}

}
