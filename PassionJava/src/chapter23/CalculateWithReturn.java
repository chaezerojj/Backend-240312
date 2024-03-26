package chapter23;

// 매개변수가 있고 반환하는 람다식
public interface CalculateWithReturn {
	int cal(int a, int b);
	
	public static void main(String[] args) {
		CalculateWithReturn c;
		c = (a, b) -> {
			return a + b; 
		// return문 사용 또는 메소드 몸체가 문장 2개 이상이면 중괄호 생략 불가
		};
		System.out.println(c.cal(4, 2));
		c = (a, b) -> {
			int sum = a + b;
			return sum;
		};
		System.out.println(c.cal(4, 2));
		
		// return문만 있으면 return키워드와 중괄호 생략 가능
//		c = (a, b) -> "str"; // int형으로 해야 함
		c = (a, b) -> a + b; // return a + b -> a + b
		System.out.println(c.cal(4, 2));
		
		
	}
}
