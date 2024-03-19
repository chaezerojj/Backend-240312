package chapter11;

public class EX6_11 {
	
	public static void main(String[] args) {
		Data1 data1 = new Data1();
		// 클래스에 생성자를 정의하지 않고도 인스턴스를 생성할 수 O
		// >> 클래스에 정의된 생성자가 없는 경우 
		// 	  컴파일러는 자동적으로 아래와 같은 기본 생성자를 추가하여 컴파일함
		// 기본 생성자: 클래스이름(){};
		// EX6_11(){};
		
		Data2 data2 = new Data2(2);
//		Data2 data2_1 = new Data2(); // compile error
		// 클래스에 생성자가 하나라도 정의되면 기본 생성자를 추가해주지 않음
		
		// 게더세더로 인스턴스 변수에 값 대입
		Data2 data_2_getset = new Data2();
		data_2_getset.setValue(22);
		
	}
}
