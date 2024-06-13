package chapter02;

public class UseVariable4 {

	public static void main(String[] args) {
		// Q. 직사각형의 넓이를 구하는 코드 작성
		int squareSide1 = 5; // 한 변의 길이
		int squareSide2 = 10; // 한 변의 길이
		System.out.println("직사각형의 넓이 : " + (squareSide1 * squareSide2));
		
		
		// Q. 직사각형의 둘레를 구하는 코드 작성
		int squareSide3 = 6; // 한 변의 길이
		int squareSide4 = 8; // 한 변의 길이
		System.out.println("직사각형의 둘레 : " + ((squareSide3 * 2) + (squareSide4 * 2)));
		
		
		// Q. 반지름을 이용하여 원의 둘레를 구하는 코드 작성
		// 반지름 * 2 * 3.14
		int radius = 4; // 반지름
		System.out.println("원의 둘레 : " + (radius * 2 * 3.14));
		
		
		// Q. 삼각형의 넓이를 구하는 코드 작성
		// 밑변 * 높이
		int triangleBaseLine = 4; // 밑변
		int triangleHeight = 7; // 높이
		System.out.println("삼각형의 넓이 : " + (triangleBaseLine * triangleHeight));
		
		
		// Q. 삼각형의 길이를 구하는 코드 작성
		// 세 변의 합
		int triangleSide1 = 7; // 한 변의 길이
		int triangleSide2 = 4; // 한 변의 길이
		int triangleSide3 = 5; // 한 변의 길이
		System.out.println("삼각형의 길이 : " + (triangleSide1 + triangleSide2 + triangleSide3));
		
		// Q. 정오각형의 둘레를 구하는 코드 작성
		int pentagonSide = 5; // 한 변의 길이
		System.out.println("정오각형의 둘레 : " + (pentagonSide * 5));
		
		// Q. 정칠각형의 둘레를 구하는 코드 작성
		int heptagonSide = 7;
		System.out.println("정칠각형의 둘레 : " + (heptagonSide * 7));
		
		// Q. 정팔각형의 둘레를 구하는 코드 작성
		int regularOctagon = 8;
		System.out.println("정팔각형의 둘레 : " + (regularOctagon * 8));
		
		// Q. 3권의 교재 총 페이지수를 구하는 코드 작성
		int book1 = 70;
		int book2 = 74;
		int book3 = 83;
		System.out.println("책 3권의 총 페이지수 : " + (book1 + book2 + book3));
	}

}
