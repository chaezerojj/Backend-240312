package chapter12;

public class Point3D extends Point {
	private int z;
	
	// 오버라이딩 조건
	// - 메소드 내용만을 새로 작성하는 것이므로 
	// 메소드 선언부(메소드이름, 메소드 매개변수, 메소드 반환타입)를
	// 상위 클래스와 정확하게 일치해야 함
	// > 1. 선언부가 상위클래스의 메소드와 일치
	// > 2. 접근 제어자를 상위 클래스의 메소드보다 좁은 범위로 변경 X
	// > 3. 예외는 상위클래스의 메소드보다 많이 선언할 수 없음
	
	public String getLocation() {
		return "x: " + x + ", y: " + getY() + "z: " + z;
	}
	// 오버라이딩
	@Override
	public void parentMethod() {
		
	}
	// overloading (매개변수) 
	public void parentMethod(int i) {
		
	}
	
	// 같은 이름의 메소드 생성 불가 - 에러
//	public void parentMethod() {
//		
//	}
	// @ - 어노테이션
	// @Override : 밑에 정의하는 메소드는 오버라이딩하는 메소드를 작성한다는것을
	// 		       컴파일러에게 알려주고 오버라이딩 문법이 틀리면 컴파일 에러 발생
	
	@Override
	public String what() {
//	public void what() { // 리턴타입이 달라 컴파일 에러 발생
//	public String what1() { // 이름이 달라 컴파일 에러 발생
		return "I am a Point3D.";
	}
	
	// >> 오버로딩: 기존에 없는 새로운 메소드 정의
	// >> 오버라이딩: 상속받은 메소드의 내용 변경
	
	
	
}






