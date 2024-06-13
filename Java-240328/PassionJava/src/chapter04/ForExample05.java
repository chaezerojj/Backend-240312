package chapter04;

public class ForExample05 {

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j <10; j++) {
				if (j % 2 == 1) {
					System.out.println("i : " + i + " j: " + j);
				}
			}
		}
	}

}
