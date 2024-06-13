package chapter17.printable2;

//? 인터페이스간 상속
// 인터페이스간 상속 - extends로 표현
public interface ColorPrintable extends Printable{
	public void printCMYK(String doc);
	// 기존 클래스 수정 필요 없음
}
