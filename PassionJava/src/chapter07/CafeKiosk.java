package chapter07;
// 키오스크 프로그램

public class CafeKiosk {
	String menu;
	int price;
	int amount;
	boolean takeout;
	
	public void setCafe(String m, int p, int am, boolean to) {
		menu = m;
		price = p;
		amount = am;
		takeout = to;
	}
	
	public void getCafe() {
		System.out.println("메뉴: " + menu);
		System.out.println("가격: " + price);
		System.out.println("수량: " + amount);
		System.out.println("테이크아웃 여부: " + takeout);
		System.out.println();
	}
	
	
	public static void main(String[] args) {
		CafeKiosk coffee1 = new CafeKiosk();
		coffee1.setCafe("아이스 아메리카노", 1500, 1, true);
		coffee1.getCafe();
		CafeKiosk coffee2 = new CafeKiosk();
		coffee2.setCafe("아이스 바닐라라떼", 3000, 2, true);
		coffee2.getCafe();
	}

}
