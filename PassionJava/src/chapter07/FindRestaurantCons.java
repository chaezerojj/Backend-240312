package chapter07;

public class FindRestaurantCons {
	String name;
	String category;
	String location;
	int michelinStar;
	int openTime;
	int lastOrder;
	
	public FindRestaurantCons(String name, String category, 
								String location, int michelinStar, 
								int openTime, int lastOrder) {
		this.name = name;
		this.category = category;
		this.location = location;
		this.michelinStar = michelinStar;
		this.openTime = openTime;
		this.lastOrder = lastOrder;
	}
	
	@Override
	public String toString() {
		return "FindRestaurantCons [name= " + name + 
				", category= " + category + ", location= " + location + 
				", michelinStar= " + michelinStar + 
				", openTime= " + openTime + ", lastOrder= " + lastOrder + "]" ;
	}
	
	public static void main(String[] args) {
		FindRestaurantCons f1 = new FindRestaurantCons("게방식당", "한식", "서울 강남구", 1, 11, 7);
		System.out.println(f1.toString());
		FindRestaurantCons f2 = new FindRestaurantCons("아웃트로 바이 비토", "유러피안", "부산 수영구", 2, 18, 23);
		System.out.println(f2.toString());
	}

}
