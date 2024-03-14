package chapter04;

public class ForExample06 {

	public static void main(String[] args) {
		for (int i = 1; i < 10; i++) {
			if (i % 2 == 0) {
				for (int j = 0; j < 10; j++) {
					if (j % 3 == 0) {
						System.out.println("i: " + i + " j: " + j);
					}
				}
			}
		}
	}

}
