package chapter07;

public class BankAccount {
	// ? 클래스와 인스턴스
	// - C언어 계열 >> 포인터
	// - 객체언어 >> 클래스

	// 프로그램의 기본 구성 크게 두가지로 나누면 
	// 데이터와 기능이 있음
	// - 테이터: 프로그램 상에서 유지하고 관리해야 할 데이터
	// - 기능: 데이터를 처리하고 조작하는 기능

	// 간단한 예금인출 프로그램
	// 예금 잔액 >> 데이터
	static int balance = 0;
	public static void main(String[] args) {
		// 입금 진행
		deposit(10000);
		// 잔액 확인
		checkMyBalance();
		// 출금 진행
		withdraw(3000);
		checkMyBalance();
		// 만약 발급받을 통장의 수가 많다면 해당 코드는 적절하지 않음
		// 데이터 + 기능 = 클래스로 만들어서 관리 필요
		
		
	}
	
	// 기능
	public static int deposit(int amount) {
		balance += amount;
		return balance;
	}
	
	// 출금
	public static int withdraw(int amount) {
		balance -= amount;
		return balance;
	}
	
	// 예금 조회
	public static int checkMyBalance() {
		System.out.println("잔액: " + balance);
		return balance;
	}

}
