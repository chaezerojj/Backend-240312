package chapter12.example;

// 고객, 물건 사는 사람
public class Buyer {
	// 소유 금액
	private int money = 1000;
	private int bonusPoint;
	
	// 구입한 제품을 저장하기 위한 배열
	Product[] cart = new Product[100];
	
	// Product cart배열에 사용될 카운터
	private int cnt = 0;
	
	// 상품 구입 메서드
	public void buy(Product p) {
		// 가진 돈보다 가격이 클 때
		if (money < p.getPrice()) {
			System.out.println("잔액이 부족하여 상품 구입이 어렵습니다.");
			return;
		}
		// 가진 돈에서 구입한 제품의 가격 빼기
		money -= p.getPrice();
		// 제품의 보너스 점수를 추가
		bonusPoint += p.getBonusPoint();
		// 제품을 cart배열에 저장
		cart[cnt++] = p;
		System.out.println(p.toString() + "을(를) 구입하셨습니다.");
	}
	
	// 구입한 물품에 대한 정보를 요약해서 보여줌
	public void summary() {
		// 구입한 제품의 합계
		int sum = 0;
		// 구입 제품 목록
		String itemList = "";
		
		// 반복문을 이용한 구입한 물품의 총 가격과 목록 만들기
		for (int i = 0; i < cnt; i++) {
			// 물건을 구입하지 않음
			if (cnt == 0) {
				System.out.println("구입한 물건이 없습니다.");
			} else {
				sum += cart[i].getPrice();
				itemList += cart[i].toString() + ", ";
			}
		}
		System.out.println("구입하신 물품의 총 금액은 " + sum + "만원 입니다.");
		System.out.println("구입하신 제품은 " + itemList + "입니다.");
	}
}









