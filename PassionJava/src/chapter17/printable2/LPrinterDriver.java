package chapter17.printable2;

public class LPrinterDriver implements Printable {

	@Override
	public void print(String doc) {
		System.out.println("~~~~ LG Print ~~~~");
		System.out.println(doc);
		
	} 

}
