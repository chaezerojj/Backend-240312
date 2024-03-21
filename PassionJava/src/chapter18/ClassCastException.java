package chapter18;

public class ClassCastException {
	
	public static void main(String[] args) {
		// 타입변환은 상위클래스-하위클래스, 구현클래스-인터페이스 간에 발생
		Animal animal1 = new Dog();
		Animal animal2 = new Animal();
		
		Dog dog1 = (Dog)animal1;
//		Dog dog2 = (Dog)animal2; // java.lang.ClassCastException
	}
}
