package chapter21;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

// List<> 인터페이스를 구현하는 클래스
// ArrayList, LinkedList
// * ArrayList (가장 많이 사용하는 리스트 형식)
// - 특정 인덱스의 객체 제거 시, 바로 뒤의 인덱스 ~ 마지막 인덱스까지 모두 앞으로 1씩 당겨짐
// - 특정 인덱스에 객체를 삽입하면 해당 인덱스부터 마지막 인덱스까지 모두 1씩 밀려남
// - >> 객체를 찾거나 맨 마지막에 객체를 추가하는 경우에는 좋은 성능 발휘

// * LinkedList
// - 특정 인덱스에 객체 추가 또는 제거가 많을 때 좋은 성능을 발휘
// - 특정 인덱스의 객체를 제거하면 앞뒤 링크만 변경되고 나머지 링크는 X
// - (인덱스 삽입 시에도 같음)

public class LinkedListClass {
	
	public static void main(String[] args) {
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new LinkedList<String>();
		
		long startTime;
		long endTime;

		// add() - 메소드 오버로딩
		// add(E element) - add(넣으려는 요소)
		// add(int index, E element)
		
		startTime = System.nanoTime();
		for (int i = 0; i < 10000; i++) {
			list1.add(0, String.valueOf(i));
		}
		endTime = System.nanoTime();
		System.out.println("ArrayList 걸린 시간: " + (endTime - startTime) + "ns");
		
		
		for (int i = 0; i < 10000; i++) {
			list2.add(0, String.valueOf(i));
		}
		endTime = System.nanoTime();
		System.out.println("LinkedList 걸린 시간: " + (endTime - startTime) + "ns");
		
		
		
	}
	
	
}
