package chapter04;

public class DongBaekJeon {

	public static void main(String[] args) {
		// 부산은행 동백전 체크카드 후불교통 서비스를 이용하여
		// 부산시 대중교통 월 45000원 초과하여 사용 시, 초과금액 최대 45000원 동백전으로 환급
		// 동백전 후불교통 최대 9만원까지 사용 가능
		
		int card = 55000;
		if (card > 45000) {
			System.out.println("이번 달 " + card + "원 사용하셨습니다.");
			System.out.println("동백전 환급이 가능합니다.");
			System.out.println("동백전은 월 최대 4만 5천원까지 환급이 됩니다.");
		} else if (card <= 45000) {
			System.out.println("이번 달 " + card + "원 사용하셨습니다.");
			System.out.println("이번 달 동백전 환급이 불가능합니다.");
			System.out.println("동백전 환급은 월 45000원 초과 사용 시 환급이 가능합니다.");
		}
		
		System.out.println("======================");
		
		int payMoney = 50000;
		if (payMoney < 45000) {
			System.out.println("환급 불가");
		} else if (payMoney < 90000) {
//			System.out.println("환급 금액: " + (90000 - payMoney));
			int payBack = payMoney - 45000;
			System.out.println("환급 금액: " + payBack);
		} else {
			System.out.println("환급 금액: 45000원");
		}
		
	}

}
