package review.phoneBook;

import java.util.ArrayList;

public class ArrayLambda {
	public static void main(String[] args) {
		ArrayList<Integer> iArr = new ArrayList<>();
		iArr.add(1);
		iArr.add(2);
		iArr.add(3);
		iArr.forEach(v -> {
			System.out.println(v);
		});
		// 스트림 - 컬렉션에 여러한 람다식을 쓸 수 있는 기능들의 집합
	}
}
