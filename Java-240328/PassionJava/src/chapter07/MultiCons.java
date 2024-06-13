package chapter07;

public class MultiCons {
	// 클래스의 인스턴스 변수 부 - 속성, field
	private String name;
	private String phoneNumber;
	
	// 생성자는 하나 이상 여러개로 존재 가능
	
	public MultiCons() {
		
	}
	public MultiCons(String name) {
		this.name= name;
	}
	// 생성자 자동완성: 마우스 오른쪽 source - generate constructor using fields
	public MultiCons(String name, String phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
	@Override
	public String toString() {
		return  "MultiCons [name=" + name + ", phoneNumber=" + phoneNumber + "]";
	}
	
	public static void main(String[] args) {
		// 기본 생성자 사용해서 인스턴스 생성
		MultiCons mc1 = new MultiCons();
		// 매개변수 1개인 생성자 호출
		MultiCons mc2 = new MultiCons("생성자1");
		// 매개변수 2개인 생성자 호출
		MultiCons mc3 = new MultiCons("생성자2", "전화번호");
		
		// 초기화 메소드를 사용하는 방법(X)
		// DTO, VO 클래스를 작성할 때 2가지 방법
		// 1. 생성자로 인스턴스 변수에 값을 대입
		// 2. getter setter 메소드로 값을 대입
		
		
		//클래스 이름 규칙
		// 1. 클래스 이름의 첫문자는 대문자로 시작
		// 2. 둘 이상의 단어가 묶여서 하나의 이름을 이룰때 새로 시작하는 단어는 대문자롷 (CamelCase)
		// ex) Circle + Point = CirclePoint
	}


}
