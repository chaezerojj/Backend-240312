package chapter17.printable3;

public class PrintMain {

	public static void main(String[] args) {
		String myDoc = "This is a report about... ";
		// Samsung Print 출력
		Printable prn = new SPrinterDriver();
		prn.print(myDoc);
		
		// LG Print 출력
		prn = new LPrinterDriver();
		prn.print(myDoc);
	
	
	}

}










