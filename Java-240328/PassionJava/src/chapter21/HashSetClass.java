package chapter21;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//? Collections 인터페이스
// 상속하는 인터페이스: List, Set, Map

//? Set 컬렉션
// - 저장 순서가 유지되지 않음
// - 객체를 중복해서 저장할 수 없고, 하나의 null만 저장 가능
// - 수학의 집합과 유사



public class HashSetClass {
	
	public static void main(String[] args) {
		// HashSet
		// - Set 인터페이스를 구현한 클래스
		Set<String> set1 = new HashSet<String>();
		Set<String> set2 = new HashSet<>();
		
		// 객체를 중복없이 저장
		// 저장 - add()
		Set<String> set = new HashSet<String>();
		set.add("Java");
		set.add("Python");
		set.add("C++");
		set.add("Spring boot");
		
		// 반복문 이용 시 Iterator, for each문 사용
		// * Iterator 반복자
		// - 전체 객체를 대상으로 한번씩 반복해서 가져오는 반복자
		// - next()메소드는 하나의 객체를 가져올 때 사용
		// - hasNext()메소드는 가져올 객체가 있으면 true 리턴
		//   , 더 이상 가져올 객체가 없으면 false 리턴
		
		Iterator<String> itr = set.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		
		System.out.println("==================");
		
		for (String s : set) {
			System.out.println(s);
		}
		// 저장된 요소의 개수 - size()
		System.out.println(set.size()); // 4
		
		// 삭제 - remove(E element)
		set.remove("C++");
		set.remove("Python");
		
		Iterator<String> itr1 = set.iterator();
		while(itr1.hasNext()) {
			System.out.println(itr1.next());
		}
		
		System.out.println("==================");
		
		List<Person> pList = new ArrayList<>();
		pList.add(new Person("John Smith1"));
		pList.add(new Person("John Smith2"));
		pList.add(new Person("John Smith3"));
		
		Iterator<Person> pItr = pList.iterator();
		while(pItr.hasNext()) {
			System.out.println(pItr.next());
		}
		
		// clear() - 모든 요소를 제거하고 비움
		set.clear();
		// isEmpty() - 컬렉션에 요소가 없는지 검증
		if (set.isEmpty()) System.out.println("set이 비어있음");
		
		
		
	}
	
	
	
}











