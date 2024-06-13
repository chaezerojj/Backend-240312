package chapter04;

public class IfExample {

	public static void main(String[] args) {
		//? 조건문 if문
		/*
		 * if (조건식) {
		 * 		실행문A
		 * 		....
		 * 		} 
		 * 1. 실행문A는 조건식이 true일때 실행됨
		 * 2. 조건식이 False라면 실행문B가 실행됨
		 * 
		 * */
		
		boolean b = true;
		if (b) {
			
		} System.out.println("코드 끝줄 실행");
		// 만약 조건식이 true가 될 때 실행해야 할 문장이 하나밖에 없다면 생략 가능
		if (true)
			System.out.println("if 블록 안에 포함되는 문장");
		System.out.println("블록 밖의 문장");
		
		if (true) {
			System.out.println("블록 안의 문장1");
			System.out.println("블록 안의 문장2");
		}
		
		System.out.println("=========================");
		
		int score = 90;
		if (score >= 90) {
			System.out.println("점수가 90 이상입니다.");
			System.out.println("A 입니다.");
		}
		if (score < 90) {
			System.out.println("점수가 90 미만입니다.");
			System.out.println("B 입니다.");
		}
		
		
		
	}

}
