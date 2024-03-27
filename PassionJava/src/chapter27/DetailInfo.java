package chapter27;

import java.util.Optional;

public class DetailInfo {
	// flatMap 메소드
	// - 중첩된 Optional 에서 사용
	Optional<String> passport;
	
	public DetailInfo(Optional<String> passport) {
		this.passport = passport;
	}

	public Optional<String> getPassport() {
		return passport;
	}

	public void setPassport(Optional<String> passport) {
		this.passport = passport;
	}
	
	public static void main(String[] args) {
		Optional<DetailInfo> di = Optional.ofNullable(null);
		// flatMap optional로 반환하는 내용물을 Optional로 감싸지 않고 그냥 반환
		// - map인 경우에는 중첩된 optional을 2번 벗겨야 하지만
		//   flatMap은 한번만 벗기면 됨
		String passport = di.flatMap(p -> p.getPassport())
									.orElse("It's null.");
		System.out.println(passport);
		
	}
	
	
}
