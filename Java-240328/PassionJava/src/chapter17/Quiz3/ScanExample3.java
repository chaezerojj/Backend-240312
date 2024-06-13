package chapter17.Quiz3;

import java.util.Scanner;

public class ScanExample3 {

	public static void main(String[] args) {
		boolean run = true;
		int balance = 0;
		Scanner scanner = new Scanner(System.in);
		
		while (run) {
			System.out.println("--------------------------------");
			System.out.println("1. 예금 / 2. 출금 / 3. 잔고 / 4. 종료 ");
			System.out.println("--------------------------------");
			System.out.print("선택 >> ");
			int choice = scanner.nextInt();
			if (choice == 1) {
				System.out.println("예금액: 10000");
			} else if (choice == 2) {
				System.out.println("출금액: 2000");
			} else if (choice == 3) {
				System.out.println("잔고: 8000");
			} else if (choice == 4) {
				System.out.println("프로그램 종료");
				break;
			}
		}
	}

}
