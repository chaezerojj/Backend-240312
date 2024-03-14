package chapter04;

public class ForExample {

	public static void main(String[] args) {
		//? 반복문
		// - for문, while문, do-while문
		
		//? for문
		// 기본형태
		/*
		 * for (초기화식; 조건식; 증감식) {
		 * 		실행문;
		 * }
		 * 
		 * */
		// 1부터 5까지 합을 구하세요
		// for문 없이 코딩
		int sum = 0;
		sum = sum + 1;
		sum += 2;
		sum = sum + 3;
		sum += 4;
		sum = sum + 5;
		System.out.println("sum 합: " + sum);
		// >> 하드코딩
		// for문 사용 코딩
		int tot = 0;
		for (int i = 0; i <= 5; i++) {
			tot += i;
		}
		System.out.println("tot 합: " + tot);
		
		System.out.println();
		
		// 초기화식의 변수는 일반 변수처럼 이름을 지어 사용 가능
		// 초기화식의 변수는 소괄호와 중괄호 내에서 사용 가능
		for (int variable = 0; variable < 10; variable++) {
			
		}
		
		// 초기화식의 초기화값은 데이터값만 맞으면 됨
		for (int i = 3; i < 10; i++) {
			System.out.println("I love Java");
		}
		System.out.println();
		
		for (int i = 0; i < 10; i++) {
			System.out.println("I love Java"); // 조건식이 true일때만 실행문이 실행됨
			// **for문 실행되는 순서
			// 1. 초기화식
			// 2. 조건식
			// 3. {}안 실행문
			// 4. 증감식
			// 5. 계속 조건식 - 실행문 - 증감식 순으로 실행됨
			// 조건식이 false(조건식 변수값 맞지 않음)시 반복문 종료
			
		}
		
		for (int i = 0; i < 3; i++) {
			System.out.println(i); // 0 1 2
		}
		//1~100까지 합을 출력
		int sum01 = 0;
		for (int i = 1; i <= 100; i++) {
			sum01 = sum01 + i;
		}
		System.out.println("1~100까지 합: " + sum01);
	
		//? 중첩 for문
		// 바깥쪽 for문이 한번 실행될 때마다
		// 중첩된 for문은 지정된 횟수만큼 반복해서 돈다
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 5; j++) {
				System.out.println("i = " + i + ", j= " + j);
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
