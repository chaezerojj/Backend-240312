package chapter04;

public class ArithOp {

	public static void main(String[] args) {
		//? 연산자
		// 대입 연산자와 산술 연산자
		// = >> 연산자 오른쪽에 있는 값을 연산자 왼쪽에 대입
		// + >> 두개의 피연산자의 값을 더함
		// - >> 빼기
		// * >> 곱하기
		// / >> 나누기
		// % >> 나머지를 반환하는 연산자
		
		int n1 = 10;
		int n2 = 3;
		int result = n1 / n2;
		System.out.println(result);
		int r1 = n1 % n2;
		System.out.println(r1);
		
		//? 연산자의 우선순위
		// - 우선순위로 처리하기 위새 소괄호로 사용 가능
		int r2 = 2 - 1 - 3 * 2;
		System.out.println(r2);
		int r3 = (3 + 3) * 2;
		System.out.println(r3);
		
		//? 복합 대입 연산자
		int num = 1;
		num = num + 5;
		num += 5; // == num = num + 5;
		int num1 = 0;
		num1 += 1;
		System.out.println(num1); // 1
		System.out.println(num1+=5); // 6
		System.out.println(num1+=15); // 21
		// a = a - b >> a -= b
		// a = a * b >> a *= b
		// a = a / b >> a /= b
		// a = a % b >> a %= b
		
		//? 관계 연산자
		// - 값은 true or false (참 또는 거짓)
		// < : n1 < n2  n1이 n2보다 작은가?
		int number1 = 0;
		int number2 = 1;
		System.out.println(number1 < number2); // true
		// 0 < 1 -> true
		boolean b1 = number1 < number2;
		System.out.println(b1); // true
		// > : n1 > n2  n1이 n2보다 큰가?
		System.out.println(number1 > number2); // false
		
		// <= : n1 <= n2  n1이 n2보다 작거나 같은가?
		System.out.println(number1 <= number2); // true
		
		// >= : n1 >= n2  n1이 n2보다 크거나 같은가?
		System.out.println(number1 >= number2); // false
		int number3 = 0;
		System.out.println(number1 >= number3); // true
		
		// == : 같은가?
		System.out.println(number1 == number2); // false 
		// 데이터 타입과 값이 다 같아야 == 값이 true 성립
		
		String stringTypeNumber = "0";
//		System.out.println(number1 == stringTypeNumber); // error : 타입이 달라 비교 불가
		
		// != : 다른가?
		System.out.println(number1 != number2); // true
		
		// 정수와 실수를 비교할 때는 값만 비교
		int num2 = 42;
		double d1 = 42.0;
		System.out.println(num2 == d1); // true
		
		//? 논리 연산자
		// & : 엠퍼센트
		// && : and연산자 >> A && B == A와 B 모두 true
		// >> 연산 결과 true
		// ** 논리연산자에서의 결과
		// ex) 피연산자1 / 피연산자2 >> 연산결과
		// true / true >> true 
		// false / true >> false
		// true / false >> false
		// false / false >> false
		System.out.println(true && true);
		System.out.println(false && true);
		System.out.println("&&연산자: " + ((0>1) && (1>2))); // false
		System.out.println("&&연산자: " + ((0>1) && (1<2))); // false
		System.out.println("&&연산자: " + ((0<1) && (1<2))); // true
		
		//? 논리 연산자 OR ||
		// A||B >> A와 B 둘 중 하나라도 true라면 연산 결과는 true
		// 마우스 or 키보드 가져오기 >> 마우스만 가져와도 ok
		// 마우스와 키보드 둘다 못가져오면 false
		// **논리연산자 OR에서 결과값 예시
		// ex) 피연산자1 / 피연산자2 >> 연산결과
		// true / true >> true
		// true / false >> true
		// false / true >> true
		// false / false >> false
		
		//? 논리 연산자 NOT !
		// 반전을 의미
		// ex) !A == A가 true값이면 false, A가 false값이면 true값이 나옴
		// **논리연산자 NOT에서 결과값 예시
		// ex) 피연산자 >> 연산결과
		// true / false
		// false / true
		System.out.println(!true); // false
		System.out.println(!false); // true
		System.out.println(!(0<1)); // false
		
		
		
		
		
		
		
		
		
		
	}

}
