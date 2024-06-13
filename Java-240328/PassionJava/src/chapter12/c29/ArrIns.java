package chapter12.c29;

import chapter12.c27.*;

public class ArrIns {
	public static void main(String[] args) {
		String str = "string";
		String[] strArr = {"s1","s2", "s3"};
		ArrIns[] arr1 = new ArrIns[3];
		// 상속관계에 있는 인스턴스들도 상위 배열 참조변수에 담을 수 있음
		Product[] pArr = new Product[3];
		// Product > Computer, Tv
		pArr[0] = new Product();
		pArr[1] = new Tv();
		pArr[2] = new Computer();
		
	} 
}
