package chapter23;

//? 매개변수가 두개인 람다식

public class TwoParamNoReturn {
	public static void main(String[] args) {
		Calculate c;
		// 매개변수가 2개이기 때문에 매개변수의 ()소괄호 생략 불가
		c = (x, y) -> System.out.println(x + y); // 덧셈
		c.cal(4, 3);
		// 뺄셈
		c = (x, y) -> System.out.println(x - y);
		c.cal(4, 2);
		
		
	}
}
