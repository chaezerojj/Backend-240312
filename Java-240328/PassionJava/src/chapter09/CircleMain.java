package chapter09;

public class CircleMain {
	
	
	public static void main(String[] args) {
		Circle c1 = new Circle(42);
		// 인스턴스 변수를 직접 접근
//		c1.rad = 10; // error - private 
		
		Circle c2 = new Circle(42);
		c1.getArea();
		c2.getArea();
		
		// 다른 클래스의 인스턴스 변수의 값을 변경할 때
		// >> getter setter 사용
		
		c1.setRad(7);
		System.out.println(c1.getArea());
		
		
		// -> 컴파일 에러는 없지만 객체지향 관점에서는 좋지 않은 코드 (결합도가 높음)
		// 프로그래머는 혼동하고 실수할 수 있기 때문에 컴파일 에러가 발생되면 더 좋은 점도 있음
		
		// 직접 접근을 막기 위해 private을 변수 앞에 붙이기
		
		// 접근 수준 지시자
		// public > protected > default > private
		
		// 객체 간 서로 메시지로 소통 - 교환 주체는 메소드
		// 인스턴스 변수에는 private
		// 인스턴스 메소드에는 public (+ public은 클래스에도)
		// public >> 다른 패키지 내에서도 접근 가능
		// protected >> 상속받은 클래스에서 접근 가능
		// default >> (접근 수준 지시자가 생략) 동일 패키지
		// private >> 클래스 내부
		
	}

}