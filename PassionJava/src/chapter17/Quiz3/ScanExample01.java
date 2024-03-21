package chapter17.Quiz3;

import java.util.Scanner;

// 키보드로 입력한 두 수를 덧셈하여 결과를 출력
public class ScanExample01 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("첫번째 수: ");
		String strNum = scanner.nextLine();
		System.out.println("두번째 수: ");
		String strNum2 = scanner.nextLine();
		
		int num1 = Integer.parseInt(strNum);
		int num2 = Integer.parseInt(strNum2);
		int result = num1 + num2;
		System.out.println("덧셈 결과: " + result);
	}
	
}
