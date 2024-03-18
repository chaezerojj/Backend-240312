package chapter07;

// 맛집

public class FindRestaurant {
	String name;
	String category;
	String location;
	int michelinStar;
	int openTime;
	int lastOrder;
	
	public void setRestaurant(String n, String c, String l, int m, int o, int lo) {
		name = n;
		category = c;
		location = l;
		michelinStar = m;
		openTime = o;
		lastOrder = lo;
	}
	
	public void getRestaurant() {
		System.out.println("맛집 이름: " + name);
		System.out.println("분야: " + category);
		System.out.println("위치: " + location);
		System.out.println("미슐랭스타: " + michelinStar);
		System.out.println("오픈 시간: " + openTime + "시, 라스트오더: " + lastOrder + "시");
		System.out.println();
	}
	
	public static void main(String[] args) {
		FindRestaurant restaurant01 = new FindRestaurant();
		restaurant01.setRestaurant("게방식당", "한식", "서울 강남구", 1, 11, 7);
		restaurant01.getRestaurant();
		
		FindRestaurant restaurant02 = new FindRestaurant();
		restaurant02.setRestaurant("아웃트로 바이 비토", "유러피안", "부산 수영구", 2, 18, 23);
		restaurant02.getRestaurant();
	}

}
