package chapter07;
// 연락처 관리 프로그램

public class ContactList {
	String name;
	String phoneNumber;
	String email;
	
	public void setContact(String n, String p, String e) {
		name = n;
		phoneNumber = p;
		email = e;
	}
	
	public void getContact() {
		System.out.println("이름: " + name);
		System.out.println("전화번호: " + phoneNumber);
		System.out.println("이메일: " + email);
		System.out.println();
	}
	
	public static void main(String[] args) {
		System.out.println("<<< 연락처 목록 >>>");
		ContactList contact01 = new ContactList();
		contact01.setContact("김자바", "010-1111-1111", "kimjava01@gmail.com");
		contact01.getContact();
		
		ContactList contact02 = new ContactList();
		contact02.setContact("박자바", "010-2222-2222", "javapark02@gmail.com");
		contact02.getContact();
		
	}

}