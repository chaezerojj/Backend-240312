package chapter27;

import java.util.Optional;

public class OptionalOrElse {
	
	public static void main(String[] args) {
		//? Optional orElse 메소드
		// empty() - null을 감사는 메소드
		
		Optional<String> os1 = Optional.empty();
		Optional<String> os2 = Optional.of("So Basic");
		String s1 = os1.map(s -> s.toString())
					.orElse("Empty");
		String s2 = os2.map(s -> s.toString())
					.orElse("Empty");
		
		System.out.println(s1); // Empty >> null을 넣었기 때문에 매개변수로 넣은 인스턴스가 반환됨
		System.out.println(s2); // So Basic >> 실제 값이 있기 때문에 그 값이 반환됨
		// >> null일 경우만 매개변수로 넣은 인스턴스가 반환됨
		
	}
}
