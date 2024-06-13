package chapter06;

public class Method {

	public static void main(String[] args) {
		//? 메소드(Method), 함수(Function)
		// 기능별로 코드를 객체로 모으고 객체 간 메시지로 상호작용
		/* ? 메소드 형식
		 * 리턴타입 메소드 이름(매개변수(생략가능)) {
		 * 		실행문
		 * }
		 * */
		//? 메소드 이름 규칙
		// - 소문자 시작 단어가 조합될 때 대문자로 만들어야함 (카멜케이스)
		// - 변수의 경우에는 첫단어를 명사 사용, 메소드는 첫 단어를 동사로 주로 사용
		// 매개변수는 변수의 선언이 들어감
		System.out.println("프로그램의 시작");
		// 메소드 호출(call)
		// - 사용방식: 메소드이름(값)
		hiEveryone(20); // 호출은 메인
		hiEveryone(30);
		System.out.println("프로그램의 끝");
		
	}
	
	
	public static void hiEveryone(int age) {
		System.out.println("좋은 아침입니다.");
		System.out.println("제 나이는 " + age + "세 입니다.");
	}

	
	
	
	
	
	
	
}
