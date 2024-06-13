package chapter17;

// 인터페이스(interface)
// - 추상(미완성)메소드만 담고 있음


public interface Printable {
	// 미완성 메소드
	// - 메소드의 몸체를 갖지 않음
	public void print(String doc);
	public void colorPrint(String doc);
	
	public static void main(String[] args) {
		// - 인스턴스 생성 불가
//		Printable printable  = new Printable(); // Cannot instantiate the type Printable
		// - 참조변수 선언 가능
		Printable printable;
		
	}
}
