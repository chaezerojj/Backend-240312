package chapter11;

// 클래스 내부에서 생성자 간에도 서로 호출이 가능
// 1. 생성자 이름으로 호출하는 대신 this 사용
// 2. 한 생성자에서 다른 생성자를 호출할 때는 
// 	  반드시 첫줄에서만 호출 가능

public class Car2 {
	private String color;
	private String gearType;
	private int door;
	
	public Car2() {
//		System.out.println("anything code"); 
		// >> 생성자 안에서 생성자 호출할 때는 첫줄
		this("white", "auto", 4);
//		Car2("white", "auto", 4); // this라는 이름으로 호출해야 함
		
	}
	
	public Car2(String color, String gearType, int door) {
		this.color = color;
		this.gearType = gearType;
		this.door = door;
	}
	
	public static Car2 getCar2() {
		// 인스턴스 메소드에서는 new 키워드를 이용한 인스턴스 생성 가능
		Car2 car2 = new Car2("blue","auto", 2);
		return car2;
	}
	
	
	public static void main(String[] args) {
		// new 키워드 대신 인스턴스 메소드를 사용하여 인스턴스 생성
		Car2 car2 = Car2.getCar2();
	}
}
