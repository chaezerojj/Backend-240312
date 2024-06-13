package chapter12;

public class SmartTv02 extends Tv02{
	private boolean netflix;
	
	public boolean isNetflix() {
		return netflix;
	}

	public void setNetflix(boolean netflix) {
		this.netflix = netflix;
	}

	public static void main(String[] args) {
//		Tv02 tv02 = new Tv();
//		int num = 0.0;
		Tv02 tv02 = new Tv02();
		SmartTv02 smartTv02 = new SmartTv02();
		// 인스턴스 타입과 참조 변수의 타입이 일치되어야 함
		Tv02 sTv02 = new SmartTv02();
//		Tv02 sTv02_1 = new SmartTv(); // 타입 일치 X
		
		// 서로 상속관계에 있을 경우
		// 상위 클래스 타입의 참조변수로 하위클래스의 인스턴스를 참조하도록 하는 것이 가능함
		// >> 상위 클래스의 멤버들만 사용할 수 있음
		// 	  (Tv02타입의 참조변수로는 Tv클래스의 멤버만 사용 가능)
		
		Tv02 sTv02_2 = new SmartTv02();
//		sTv02_2.setNetflix(); // 상위클래스 멤버가 아니라 사용 안됨
		sTv02_2.setPower(true);
		// >> 둘 다 같은 타입의 인스턴스지만 참조변수의 타입에 따라 사용할 수 있는 멤버 개수가 달라짐
		
		// 하위클래스 참조변수로 상위 클래스 인스턴스 참조 불가능
//		SmartTv02 smartTv22 = new Tv02(); 
		// error - Type mismatch: cannot convert from Tv02 to SmartTv02
		
	}
}
