package chapter23;

import java.util.Random;

// 매개변수가 없고 리턴만 있는 람다식

public interface Generator {
	int rand();
	
	public static void main(String[] args) {
		
		Generator gen = () -> {
		// 매개변수 없는 경우, 소괄호 반드시 써야 함	
			Random rand = new Random();
			// 정수를 랜덤으로 생성해주는 Random
			// - Random 라이브러리에는 랜덤으로 생성해주는 간단한 메소드들이 많음
			// nextInt() - 정수를 간편하게 랜덤 생성
			// - 매개변수에 넣은 정수까지의 정수 범위 내에서 랜덤으로 생성
			return rand.nextInt(43); // 1부터 43의 범위에서 랜덤한 정수 생성
		};
		System.out.println(gen.rand()); 
		
		// 한줄로 작성하면
		Random rand = new Random();
		gen = () -> rand.nextInt(43);
		System.out.println(gen.rand());
		
	}
	
}
