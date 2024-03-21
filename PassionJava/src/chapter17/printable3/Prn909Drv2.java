package chapter17.printable3;
// 컬러 프린터 드라이버
public class Prn909Drv2 implements Printable {
	@Override
	public void print(String doc) {
		System.out.println("흑백 출력중 ... ");
		System.out.println(doc);
	}
	
	@Override
	public void printCMYK(String doc) {
		System.out.println("컬러 출력중 ... ");
		System.out.println(doc);
	}
}
