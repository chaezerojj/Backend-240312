package chapter17.scanner;

import java.util.Scanner;

public class ScannerTest2 {

	public static void main(String[] args) {
		// Scanner 클래스의 콘솔 입력 적용
		Scanner sc = new Scanner(System.in);
		// 콘솔에서 정수값 출력
		System.out.println("정수값을 입력하세요. >> ");
		int num1 = sc.nextInt(); // nextInt() : 정수값 입력 받는 메소드
		System.out.println("입력한 정수 값: " + num1);
		
	}

}
