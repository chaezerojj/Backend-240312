package chapter04;

public class ElseIfExample {

	public static void main(String[] args) {
		//? Else if문
		/* if (조건문1) {
		 * 		실행문A
		 * } else if (조건문2) {
		 * 		실행문B
 		 * } else if (조건문3) {
 		 * 		실행문C
 		 * } else {
 		 * 		실행문D
 		 * }
 		 * >> 단, else 블록은 생략 가능
 		 */
		
		int score = 75;
		if (score >= 90) {
			System.out.println("A등급");
		} else if (score >= 80) {
			System.out.println("B등급");
		} else if (score >= 70) {
			System.out.println("C등급");
		} else {
			System.out.println("D등급");
		}
		
		
		
		
		
	}

}
