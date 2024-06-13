package chapter07;

public class ContactListGS {
	String name;
	String phoneNumber;
	String email;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "ContactListGS [name= " + name + ", phoneNumber= " +phoneNumber + ", email= " + email + "]";
	}
	
	public static void main(String[] args) {
		ContactListGS contact1= new ContactListGS();
		contact1.setName("홍길동");
		contact1.setPhoneNumber("010-0000-0000");
		contact1.setEmail("hgd1111@naver.com");
		System.out.println(contact1.toString());
		
	}

}
