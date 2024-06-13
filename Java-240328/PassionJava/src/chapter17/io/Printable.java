package chapter17.io;

//? 인터페이스 대상의 instanceof 연산자
// if (ca instanceof Cake)...
// Cake는 클래스의 이름과 인터페이스의 이름이 될 수 있음
// ca를 참조하는 인스턴스를 Cake형 참조변수로 참조할 수 있다면 True 반환

public interface Printable {
	public void printLine(String str);
}
