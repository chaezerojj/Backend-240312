package chapter07;

// 인스턴스 변수에 값을 처음 대입하기 위해 초기화를 위한 메소드를 정의
// 값을 처음 대입 == 초기화

//? 생성자 메소드 (constructor method)
// - 초기화 메소드를 대신하는 생성자

public class BankAccount003 {
	String accNumber; // 계좌번호
	String ssNumber; // 주민번호
	int balance; // 잔액
	//? 생성자 메소드
	// 1. 생성자의 이름은 클래스의 이름과 동일해야 함
	// 2. 생성자는 값을 반환하지 않고 반환형도 표시하지 않음
	public BankAccount003(String acc, String ss, int bal) {
		accNumber = acc;
		ssNumber = ss;
		balance = bal;
	}

	public static void main(String[] args) {
		// 생성자 호출
		// 인스턴스 생성 시 생성자를 호출
		BankAccount003 b1 = new BankAccount003("12-23-123456", "000101-3333333", 10000);
		
		// 변수에 직접 접근하는 것은 객체지향 언어의 정보은닉에 위배되는 행위이기 때문에 금지
		System.out.println(b1.accNumber);
		
		
	}

}

