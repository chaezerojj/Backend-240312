package chapter17.scanner;

import java.util.Scanner;

public class ScannerTest3 {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
//		System.out.print("문자열 입력: ");
		//nextLine() 문자열 입력 받는 메소드
//		String str1=sc.nextLine();
//		System.out.println("입력된 문자열: "+str1);
		//다양한 자료형을 입력 받을 수 있는 메소드
		// byte nextByte()
		// double nextDouble()
		// boolean nextBoolean()
		//버그 - 숫자형을 입력 받을 때 엔터 처리가 잘 안됨
		System.out.print("정수 입력: ");
		int num1=sc.nextInt();
		System.out.println("입력된 정수: "+num1);
		System.out.print("문자열 입력: ");
		//nextLine() 문자열 입력 받는 메소드
		String str2=sc.nextLine();
		System.out.println("입력된 문자열: "+str2);
	}
}
