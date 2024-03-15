package chapter06;

public class VarScope {

	public static void main(String[] args) {
		//? 변수의 스코프(scope)
		// - 변수는 같은 영역, 하위 영역 내에서 동일이름으로 선언 불가
		
		int num1 = 11;
//		int num1 = 50;
		// 동등 레벨의 다른 영역에서는 동일 이름의 변수 선언 가능
		if(true) {
//			int num1; // error - 같은 영역 내에서 동일 이름의 변수 선언 불가
			int num2 = 42;
		}
		if (false) {
			int num2 = 42;
			for (int i = 0; i < 3; i++) {
//				int num2;
			}
		}
		
		
	}
	
	public static void methodName() {
		int num1;
		int num2;
	}
	
	
	
	
	

}
