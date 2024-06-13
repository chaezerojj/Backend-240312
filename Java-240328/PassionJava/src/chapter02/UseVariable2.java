package chapter02;

public class UseVariable2 {

	public static void main(String[] args) {
		//? 변수의 이름
		// - 카멜 표기법(camelCase)
		// 변수는 소문자로 시작하고, 다른 단어가 조합될 때 대문자로 시작
		
		//? 정사각형의 넓이를 구하는 코드 작성
		// 공식: 한 변의 길이 * 한 변의 길이
		// 정사각형의 한 변의 길이는 7
		
		int squareSide;
		squareSide = 7;
		System.out.println("정사각형의 넓이는 " + (squareSide * squareSide) + "입니다.");
		squareSide = 70;
		System.out.println("정사각형 한 변: " + squareSide);
		
		int num1;
//		System.out.println(num1); -- error: 값을 처음 대입(초기화)해서 사용
		
		int num2 = 42;
		
		int a,b,c; // 여러 개를 동시에 선언 및 초기화
		a = 1; b = 2; c = 3;
		
		// 같은 공간에서는 이름이 같은 변수가 존재할 수 없다
//		int a; -- error: 이름이 동일한 변수 선언 X
		
		int d = 1, e = 2;
		// 정수 연산을 위해선 어떤 자료형을 사용?
		// == int
		// cpu 개발을 할 때 int 자료형을 기본으로 생각하고 개발하기 때문에 int형 자료의 계산이 가장 빠름
		// 정수 - byte, short, int, long
		
		
		// * 1byte = 8bit
		// * 1bit = 1, 0
		// int형 범위: -2147483648 ~ 2147483647
//		int limitNum = 2200000000; -- error: 컴파일 에러
		// bigInteger
		// 
		
	}

}
