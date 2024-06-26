package chapter21;

import java.util.*;

public class ArrayListCollections {
	
	public static void main(String[] args) {
		// 제네릭타입<>
		// - <>안에 저장하고 싶은 클래스 타입 넣음
		// - 길이가 가변
		// - List 컬렉션을 구현하는 클래스
		// - >> ArrayList, LinkedList
		
		ArrayList<Integer> list1 = new ArrayList<Integer>(10);
		ArrayList<Integer> list2 = new ArrayList<>(10); // 뒤에는 <>안 타입 생략 가능
		List<String> sList = new ArrayList<>();
		
		// 객체 저장
		sList.add("JAVA");
		sList.add("Python");
		sList.add("C++");
		sList.add("Java Script");
		for (String str : sList) {
			System.out.println(str);
		}
		
		// 저장된 총 객체수 얻기 - size()
//		sList.size();
		System.out.println(sList.size()); // 4
		
		System.out.println("====================");
		
		// 인덱스를 이용한 객체 얻기 - get()
		System.out.println("0번째 인덱스 값: " + sList.get(0));
		System.out.println("1번째 인덱스 값: " + sList.get(1));
		System.out.println("2번째 인덱스 값: " + sList.get(2));
		System.out.println("3번째 인덱스 값: " + sList.get(3));
		
		for (int i = 0; i < sList.size(); i++) {
			System.out.println(sList.get(i));
		}
		System.out.println("====================");
		
		// 인덱스를 이용하여 객체 삭제 - remove()
		sList.remove(1); // Python삭제
		for (String str : sList) {
			System.out.println(str);
		}

		System.out.println("====================");
		
		ArrayList<Integer> list3 = new ArrayList<>();
		int num1 = 10;
		list3.add(num1);
		int num2 = list3.get(0);
		for (int i : list3) {
			System.out.println(i);
		}
		
		
		
		
		
	}
}
