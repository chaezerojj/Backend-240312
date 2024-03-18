package chapter07;

public class CafeKioskGS {
	String menu;
	int price;
	int amount;
	boolean takeout;
	
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public boolean isTakeout() {
		return takeout;
	}

	public void setTakeout(boolean takeout) {
		this.takeout = takeout;
	}
	
	@Override
	public String toString() {
		return "CafeKioskGS [menu= " + menu + ", price= " + price 
					+ "원, amount= " + amount + ", takeout= " + takeout + "]";
	}
	
	public static void main(String[] args) {
		CafeKioskGS kiosk = new CafeKioskGS();
		kiosk.setMenu("딸기 스무디");
		kiosk.setPrice(3500);
		kiosk.setAmount(2);
		kiosk.setTakeout(true);
		System.out.println(kiosk.toString());
	}

}
