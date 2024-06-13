package chapter23;

//? 람다(Lambda)
// * 인터페이스를 구현하는 방법
// - 1. class 생성
// - 2. 익명클래스 사용
// - 3. 람다(Lambda) 사용
// 		- JDK 1.8 이후 버전부터 사용 가능
// 		- 객체지향 프로그래밍과 함수형 프로그래밍을 혼합하여 사용 가능


public class AboutLambda {
	public static void main(String[] args) {
		// 익명클래스 사용 - 익명클래스로 인스턴스 생성(자동완성으로 클래스 생성됨)
		Printable prn = new Printable() {
			@Override
			public void print(String s) {
				System.out.println(s);
			}
		};
		prn.print("Hello World!");
		
		//? 람다 사용하여 인터페이스 구현
		// - 조건: 미완성 메소드가 하나의 인터페이스에서만 사용 가능
		// - 익명클래스와 유사하지만 더 축약된 형태로 사용됨
		// - 몸체와 매개변수만 있으면 됨
		// - 인터페이스 내 이미 정의된 부분들 제외하고 몸체와 매개변수만을 정의함
		// - 메서드의 매개변수의 이름과 함수 블록 사이를 화살표(->)로 표시
		// - 형태:
		Printable prn1 = (s) -> {
			System.out.println(s);
		}; // 세미콜론 찍어야함
		prn1.print("Lambda Example");
		
		
		
	}
}
