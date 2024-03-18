package chapter07;

public class CafeKioskCons {
	String menu;
	int price;
	int amount;
	boolean takeout;
	
	public CafeKioskCons(String menu, int price, int amount, boolean takeout) {
		this.menu = menu;
		this.price = price;
		this.amount = amount;
		this.takeout = takeout;
	}
	
	@Override
	public String toString() {
		return "CafeKioskCons [menu= " + menu + ", price= " 
				+ price + "원, amount=" + amount + ", 테이크아웃: " + takeout + "]" ;
	}
	
	public static void main(String[] args) {
		CafeKioskCons kiosk = new CafeKioskCons("아이스아메리카노", 1500, 2, true);
		System.out.println(kiosk.toString());
	}

}
