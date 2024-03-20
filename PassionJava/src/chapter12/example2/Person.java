package chapter12.example2;

public class Person {
	private int money = 90000;
	private int amount;
	
	Fruits[] cart = new Fruits[40];
	
	private int count = 0;
	
	public void buy(Fruits f) {
		if (money < f.getPrice()) {
			System.out.println("잔액이 부족합니다.");
			return;
		} else {
			money -= f.getPrice();
			amount += f.getAmount();
			cart[count++] = f;
			System.out.println(f.toString() + "을(를) 구매합니다.");
		}
		}
	// 구매 정보
	public void receipt() {
		int sum = 0;
		String buyList = "";
		
		for (int i = 0; i < count; i++) {
			if (count <= 0) {
				System.out.println("구입 내역이 없습니다.");
			} else {
				sum += cart[i].getPrice();
				buyList += cart[i].toString() + "& ";
			}
		}
		System.out.println("총 " + sum + "원 구매하였습니다.");
		System.out.println("구매 목록 " + buyList);
	}
}
