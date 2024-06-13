package chapter06;

public class Quiz {

	public static void main(String[] args) {
		System.out.println(add(1, 1));
		System.out.println(minus(10, 4));
		System.out.println(multiply(2, 8));
		System.out.println(divide(50, 5));
		System.out.println(remain(66, 6));
		System.out.println(perimeter(50, 4));
		System.out.println(area(6, 6));
		System.out.println(rectangleArea(7, 8));
		System.out.println(circleArea(4));
		System.out.println(square(8));
	}
	// 두 수를 입력 받아 더한 값을 리턴 해주는 함수 만들기
	public static int add(int a, int b) {
		System.out.println("두 수를 입력하면 더한 값이 나옵니다.");
		return a + b;
	};
	
	// 두 수를 입력 받아 뺀 값을 리턴 해주는 함수 만들기
	public static int minus(int a, int b) {
		System.out.println("두 수를 입력하면 뺀 값이 나옵니다.");
		return a - b;
	};
	
	// 두 수를 입력 받아 곱한 값을 리턴 해주는 함수 만들기
	public static int multiply(int a, int b) {
		System.out.println("두 수를 입력하면 곱한 값이 나옵니다.");
		return a * b;
	};
	
	// 두 수를 입력 받아 나눈 값을 리턴 해주는 함수 만들기
	public static int divide(int a, int b) {
		System.out.println("두 수를 입력하면 나눈 값의 몫이 나옵니다.");
		return a / b;
	};
	
	// 두 수를 입력 받아 나머지 값을 리턴 해주는 함수 만들기
	public static int remain(int a, int b) {
		System.out.println("두 수를 입력하면 두 수를 나눈 나머지 값이 나옵니다.");
		return a % b;
	}
	
	// 직사각형의 두변을 입력 받아 둘레는 리턴 해주는 함수
	public static int perimeter(int a, int b) {
		System.out.println("직사각형의 둘레 값 : ");
		return a*2 + b*2;
	}
	
	// 직사각형의 두변을 입력 받아 넓이를 리턴 해주는 함수
	public static int area(int a, int b) {
		System.out.println("직사각형의 넓이 값 :");
		return a * b;
	};
	
	// 삼각형의 넓이와 높이를 입력 받아 넓이를 리턴 해주는 함수
	public static int rectangleArea(int area, int height) {
		System.out.println("삼각형의 넓이 : ");
		return area;
	}
	
	// 원의 반지름을 입력 받아 넓이는 리턴 해주는 함수
	public static double circleArea(int radius) {
		System.out.println("원의 넓이 : ");
		return radius * radius * 3.14;
	};
	
	// 정사각형의 한변을 입력 받아 넓이는 리턴 해주는 함수
	public static int square(int a) {
		System.out.println("정사각형의 넓이 : ");
		return a * a;
	}
}
