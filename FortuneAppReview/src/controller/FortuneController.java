package controller;

import service.FortuneService;
import view.FortuneView;

public class FortuneController {
	private FortuneView fortuneView;
	private FortuneService fortuneService;
	
	// 앱 시작
	public void runApp() {
		int choice;
		while (true) {
			// 메뉴 보이기
			choice = fortuneView.getMenu();
			// 기능에 따라 메뉴 분리
			switch (choice) {
			case 0:
				return;
			case 1:
				// 포춘 쿠키 열기(read)
				getFortune();
				break;
			case 2:
				// 운세 저장하기(create)
				putFortune();
				break;
			case 3:
				// 운세 전체 출력
				getFortunesAll();
				break;
			case 4:
				// 운세 수정
				break;
			case 5:
				// 운세 삭제
				break;
			}
		}
	}

	public FortuneController(FortuneService fortuneService) {
		this.fortuneView = new FortuneView();
		this.fortuneService = fortuneService;
	}

	// 운세를 생성하는 메소드
	public void createFortune(String fortuneStr) {
		fortuneService.createFortune(fortuneStr);
	}
	
	// 운세를 저장 (Create)
	public void putFortune() {
		String fortuneStr = fortuneView.putFortune();
		// 포춘 인스턴스 생성 및 배열에 저장
		fortuneService.createFortune(fortuneStr);
	}
	
	// 모든 운세들을 출력
	public void getFortunesAll() {
		fortuneView.getFortunesAll(fortuneService.getFortuneDtos());
	}
	
	// 하나의 운세를 출력(read)
	public void getFortune() {
		fortuneView.getFortunesAll(fortuneService.getFortuneDtos());
	}
	

}
