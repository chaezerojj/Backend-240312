package chapter12.example2;

public class Market {

	public static void main(String[] args) {
		Person p = new Person();
		p.buy(new Apple());
		p.buy(new Melon());
		p.buy(new Banana());
		p.receipt();
	}

}
