package chapter04;

public class ContinueExample {

	public static void main(String[] args) {
		//? continue
		// - 반복문에서만 사용 가능
		// continue문이 실행되면 조건식으로 이동함
		/*
		 * for(...) {
		 * 		실행문1
		 * 		continue;
		 * 		실행문2
		 * }
		 * */
		// 1에서 10사이의 실수 중에서 짝수만 출력하는 코드
		for (int i = 1; i <=10; i++) {
			if (i % 2 != 0) {
//				System.out.println(i + " >> 홀수입니다.");
				continue;
			}
			System.out.println(i + " 짝수");
		}
		
		
		
	}

}