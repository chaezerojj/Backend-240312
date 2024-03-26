package chapter26;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

// 인스턴스 메소드일 경우 메소드 참조하여 사용 가능

public class MethonRefEf {
	
	public static void main(String[] args) {
		List<Integer> list = Arrays.asList(1, 3, 5, 6, 9);
		list = new ArrayList<>(list);
		JustSort js = new JustSort();
//		Consumer<List<Integer>> c = e -> js.sort(e);
		Consumer<List<Integer>> c = js::sort;
		c.accept(list);
		System.out.println(list);
	}
}
