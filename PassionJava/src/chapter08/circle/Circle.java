package chapter08.circle;

//? 패키지 (Package)

// 객체지향 언어
// 객체- 라이브러리, 모듈, API 
// >> 객체 단위로 부품화하여 재사용
// 객체의 기본 단위 - 자바 객체의 기본 단위: class

public class Circle {
	double rad;
	final double PI;
	
	public Circle(double r) {
		rad = r;
		PI = 3.14;
 	}
	
	public double getArea() {
		return (rad * rad) * PI;
	}
	

}
