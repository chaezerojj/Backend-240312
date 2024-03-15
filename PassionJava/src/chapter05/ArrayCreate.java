package chapter05;

public class ArrayCreate {

	public static void main(String[] args) {
		//? 배열
		// 변수는 1개의 데이터만 저장
		// 저장해야 할 데이터의 수가 많아지면 그만큼의 변수가 필요하여 코드가 길어짐
		// >> 많은 양의 데이터를 적은 코드로 쉽게 처리할 수 있는 배열(array) 사용
		
		// 배열이란, 
		// 같은 타입의 데이터를 연속된 공간에 나열하고 각 데이터에 인덱스를 부여해놓은 자료구조
		// 배열의 특징
		// - 같은 타입의 데이터만 저장 가능
		// - 한 번 생성된 배열의 길이는 변경 불가능
		
		//? 배열 선언
		// - 배열 변수 선언은 두가지 형식이 있음
		// 1. 타입[] 변수
		int[] intArray;
		double[] doubleArray;
		String[] strArray;
		
		// 2. 타입 변수 []
		int intArr[];
		double doubleArr[];
		String strArr[];
		
		//? 배열 생성
		// - 값 목록으로 배열생성
		String name1 = "홍길동";
		String name2 = "김자바";
		String name3 = "박자바";
		// ... 계속 변수를 하나씩 지정하기에는 비효율적 >> String 배열로 생성
		String[] names = {"홍길동", "김자바", "박자바"};
		// 읽어오는 방법 - 참조
		// 배열변수 이름[인덱스값]
		// 인덱스는 각 항목의 데이터를 읽거나 저장하는데 사용
		// 배열 이름 옆 대괄호[]에 기입
		// 인덱스는 0부터 시작
		System.out.println(names[0]); // 홍길동
		System.out.println(names[1]); // 김자바
		System.out.println(names[2]); // 박자바
		
		String[] fruits = {"바나나", "사과", "딸기"};
		// 콘솔에 사과 딸기 바나나 순으로 출력하기
		System.out.println(fruits[1] + fruits[2] + fruits[0]);
		fruits[0] = "수박";
		System.out.println(fruits[0]);
		
		System.out.println("====================");
		
		int[] scores = {80, 90, 87};
		System.out.println("scores[0] : " + scores[0]);
		System.out.println("scores[1] : " + scores[1]);
		System.out.println("scores[2] : " + scores[2]);
		
		System.out.println("====================");
		
		// 모든 점수를 콘솔에 출력
		for (int i = 0; i < 3 ; i++) {
			System.out.println(scores[i]);
		}
		
		System.out.println("====================");

		// 모든 점수의 합 구하기
		int sum = 0;
		for (int i = 0; i < 3; i++) {
			sum = sum + scores[i];
		} 
		
		System.out.println("점수 합: " + sum);
		
		System.out.println("====================");
		
		// 평균 점수 구하기 - 총합/개수
		double avg = sum / 3;
		System.out.println("평균 점수: " + avg);
		
		System.out.println("====================");

		String[] colors = {"검정색", "빨간색", "초록색", "파란색"};
//		System.out.println(colors[4]); // error - java.lang.ArrayIndexOutOfBoundsException
//		colors[4] = "노란색"; // error - java.lang.ArrayIndexOutOfBoundsException
		// >> 배열 길이를 벗어남. 배열 길이는 변경 불가능
		
		for (int i = 0; i < 4; i++) {
			System.out.println(colors[i]);
		}
		
		
	}

}
