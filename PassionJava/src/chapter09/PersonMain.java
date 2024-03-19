package chapter09;

public class PersonMain {
	
	public static void main(String[] args) {
		Person p1 = new Person();
		p1.setName("홍길동");
		p1.setAge(20);
		System.out.println(p1.toString());
		
		// 나이를 음수로 입력
		Person p2 = new Person();
		p2.setName("김자바");
		p2.setAge(-42);
		System.out.println(p2.toString());
		// 웹 >> (프론트엔드) html5, 자바스크립트로 데이터 제약사항 체크
		// 자바 - (백앤드) 서버사이드로 데이터 제약사항 체크
		// 데이터베이스 - 데이터 제약사항 체크
		
		// 인스턴스 변수는 private 지정 필요
		Person p3 = new Person();
		p3.setName("김실수");
//		p3.age = -42; // 직접 접근으로 음수를 대입 
		// >> private으로 age 지정했기 때문에 컴파일 에러 발생
		System.out.println(p3.toString());
		
		
	}

}
