package chapter10;

//? static 키워드
// 사용을 거의 하지 않음
// enum 나열 값

public class InstCnt {
	private int instNum = 1;
	static int instStaticNum = 0; // static은 굳이 private을 붙이진 않음
	
	public InstCnt(int instNum) {
		this.instNum = instNum;
	}
	
	@Override
	public String toString() {
		return "Inst [instNum= " + instNum + "]";
	}
	
	public static void sayHello() {
		System.out.println("Hello World!");
	}

	public static void main(String[] args) {
		// 인스턴스 변수 instNum 사용을 위해
		// 인스턴스 생성- 클래스 틀을 이용하여 인스턴스를 생성하고 메모리에 올림
		InstCnt instCnt = new InstCnt(42);
		System.out.println(instCnt.toString());
		// static 선언을 붙이면 클래스 변수가 됨
		// static 의미: 바로 사용 가능하게 메모리에 올림
		InstCnt.instStaticNum = 42;
		System.out.println(instStaticNum);
		// 메소드 내부 변수
		// 메소드에도 static을 붙이면 클래스 메소드로 됨
		// >> 메모리에 바로 적재되어 사용 가능
		int num1 = 0;
		InstCnt.sayHello();
		// 클래스 내부에서 static 변수나 메소드 사용시 클래스 이름 생략 가능
		sayHello();
		System.out.println(instStaticNum);
		
		// static을 붙인 클래스 변수나 메소드 사용은 하지 않음
		// enum - 나열되는 데이터 값을 이용
		
		// main 메소드
		// - 인스턴스 생성과 관계없이 제일 먼저 호출되는 메소드
		// - static을 붙여야 함
		// - main메소드 호출 명령은 외부로부터 시작되는 명령
		// >> public이 붙어있음
	}
}
