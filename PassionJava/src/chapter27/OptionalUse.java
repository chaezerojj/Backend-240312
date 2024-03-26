package chapter27;

import java.util.Optional;

public class OptionalUse {
	
	public static void main(String[] args) {
		// of는 null 허용 안함
		Optional<String> os1 = Optional.of(new String("Toy1"));
		// ofNullable은 null 허용함
		Optional<String> os2 = Optional.ofNullable(new String("Toy2"));
		// 일종의 Wrapper 클래스
		
		// isPresent() - null인지 아닌지 판별하는 메소드
		// get() -> 감싸고 있던 인스턴스를 반환하는 메소드
		if (os1.isPresent()) {
			System.out.println(os1.get());
		}
		if (os2.isPresent()) {
			System.out.println(os2.get());
		}
		
		// 람다식 버전
		os1.ifPresent(s -> System.out.println(s));
		// 메소드 참조 버전
		os1.ifPresent(System.out::println);
	}
	
}
