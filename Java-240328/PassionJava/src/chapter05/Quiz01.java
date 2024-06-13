package chapter05;

public class Quiz01 {

	public static void main(String[] args) {
		// while문과 Math.random() 메소드를 이용해서 2개의 주사위를 던졌을 때 나오는 눈을
		// (눈1, 눈2) 형태로 출력하고, 눈의 합이 5가 아니면 계속 주사위를 던지고,
		// 눈의 합이 5이면 실행을 멈추는 코드를 작성해보세요.
		// 눈의 합이 5가 되는 조합은 (1, 4), (4, 1), (2, 3), (3, 2) 입니다.
		
		int[] numbers = new int[2];
		while (true) {
			numbers[0] = (int)(Math.random() * 6) + 1;
			numbers[1] = (int)(Math.random() * 6) + 1;

			if (numbers[0] + numbers[1] == 5) {
				System.out.println("두 눈의 합이 5입니다.");
				System.out.println(numbers[0] + ", " + numbers[1]);
				break;
			} else {
				System.out.println(numbers[0] + ", " + numbers[1]);
			}
		}
		
		
		
	}

}