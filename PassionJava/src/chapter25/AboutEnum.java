package chapter25;

//? 열거형(Enum)
// - 여러 상수를 편리하게 선언할 수 있는 방법
// * 열거형 정의
// - enum 열거형이름 {상수명1, 상수명2, ...}
// * 열거명에 정의된 상수를 사용하는 방법
// - 열거형 이름.상수명 >> 클래스의 static 변수를 참조하는 것과 같음

public class AboutEnum {
	// 열거형 kind를 정의
	enum Kind {
		CLOVER, HEART, DIAMOND, SPADE
	}
	
	// 열거형 Value를 정의
	enum Value {
		TWO, THREE, FOUR
	}
	
	public static void main(String[] args) {
		System.out.println(Card.CLOVER == Card.TWO);
		
		// 출력은 true이지만 false로 나와야 의미상 맞음
		// 열거형을 이용하여 상수를 정의한 경우는 값을 비교하기 전 타입을 먼저 비교
		// >> 값이 같아도 타입이 다르면 컴파일 에러 발생
		
//		System.out.println(AboutEnum.Kind.CLOVER == AboutEnum.Value.TWO);
		// >> 컴파일 에러 발생 (타입이 달라 비교 불가)
	}
}
