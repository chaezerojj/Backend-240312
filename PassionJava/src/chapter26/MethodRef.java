package chapter26;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;

//? 메소드 참조
// - 람다식을 더 간락하게 사용
// - * 메소드 참조의 4가지 유형
// - 1. static 메소드 참조
// - 2. 인스턴스 메서드 참조
// - 3. 매개변수의 메소드 참조
// - 4. 생성자 참조

public class MethodRef {
	
	public static void main(String[] args) {
		List<Integer> list = Arrays.asList(1, 3, 5, 7 , 9);
		list = new ArrayList<>(list);
		
//		Collections.reverse(list);
//		for (int i : list) {
//			System.out.println(i);
//		}
		
		// 추상메소드 1개를 가지고 있는 인터페이스 4가지
		// - 그중 하나 >> Consumer<T> void accept(T t)
		// Consumer<T> void accept (T t)
		// 컬렉션 프레임워크 - Collections 클래스 다양한 기능을 하는 메소드
		// reverse() 메소드 - 컬렉션의 순서를 뒤집는 기능
		
//		Consumer<List<Integer>> c = l -> Collections.reverse(l);
		Consumer<List<Integer>> c = Collections::reverse;
		// :: >> 메소드 레퍼런스를 나타내는 연산자
		// - 람다 표현식을 간결하게 표현하기 위한 것
		// static 메소드 참조
		// 전달되는 인자를 static 메소드를 호출하면서 그대로 전달할 경우
		c.accept(list);
		System.out.println(list);
		
	}

}
