package chapter26;

import java.util.List;
import java.util.Collections;

public class JustSort {
	//? 와일드카드
	// - ? : 제네릭 문법 중 하나
	// Object
	public void sort(List<?> list) {
		Collections.reverse(list);
	}
}
