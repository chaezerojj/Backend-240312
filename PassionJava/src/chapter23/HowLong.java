package chapter23;

// 매개변수가 있고 반환하는 람다식

public interface HowLong {
	int len(String s);
	
	public static void main(String[] args) {
		HowLong hl = s -> s.length(); 
		// return s.length(); - return 키워드 생략됨
		System.out.println(hl.len("I am so happy"));
		
	}
}
