package chapter07;

public class Person {
	String name;
	String phoneNumber;
	
	public Person(String name, String phoneNumber) {
		// this >> 인스턴스 변수를 지칭
		// this 자기 자신을 가르키고, 클래스 내부에서만 사용 가능
		// this.name == Person.name
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
//	public void setPerson(String n, String pn) {
//		name = n;
//		phoneNumber = pn;
//	}
	
	// toString() 자동완성
	// 인스턴스 변수에 어떤 값이 있는지 확인하ㅏ는 용도
	// source - Generate toString()
	@Override
	public String toString() {
		return "Person [name=" + name + ", phoneNumber=" + phoneNumber + "]";
	}
	
	public static void main(String[] args) {
		Person p1 = new Person("홍길동", "010-0000-0000");
		System.out.println(p1.toString());
	}

}
