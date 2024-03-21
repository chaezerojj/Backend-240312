package chapter17.printable3;

// 문제 상황 제시
// - 컬러 프린트 메소드가 추가되는 상황
// - 인터페이스가 많을 때, 인터페이스간 상속은 인터페이스의 수만큼 상속해야함
// >> 인터페이스의 디폴트 메소드
public interface Printable {
	public void print(String doc);
	// 디폴트 메소드
	default void printCMYK(String doc) {}
	// - 구현해도 되고 안해도 되는 메소드 
}
