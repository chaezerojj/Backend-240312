package chapter07;

public class ContactListCons {
	String name;
	String phoneNumber;
	String email;
	
	public ContactListCons(String name, String phoneNumber, String email) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "ContactListCons [name= " + name + ", phoneNumber= " +phoneNumber + ", email= " + email + "]";
	}
	
	public static void main(String[] args) {
		ContactListCons contact1 = new ContactListCons("박자바", "010-1111-2222", "parkjava123@naver.com");
		System.out.println(contact1.toString());
	}

}
