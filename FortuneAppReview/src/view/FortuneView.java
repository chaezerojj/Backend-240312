package view;

import java.util.List;
import java.util.Random;
import java.util.Scanner;

import dto.FortuneDto;

// 콘솔 view 담당 클래스
public class FortuneView {
	private Scanner scanner = new Scanner(System.in);
	private Random random = new Random();
	
	public int getMenu() {
		System.out.println("🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪");
		System.out.println("   포춘 쿠키 콘솔 앱입니다.");
		System.out.println("🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪");
		System.out.println("🍪 0. 종료");
		System.out.println("🍪 1. 포춘 쿠키 열기");
		System.out.println("🍪 2. 운세 입력 및 저장");
		System.out.println("🍪 3. 운세 전체 출력");
		System.out.println("🍪 4. 운세 수정하기");
		System.out.println("🍪 5. 운세 삭제하기");
		System.out.println("🍪 메뉴 선택 >>");
		int choice = -1;
		choice = scanner.nextInt();
		scanner.nextLine();
		return choice;
	}
	
	// 모든 운세들을 출력
	public void getFortunesAll(List<FortuneDto> fortuneDtos) {
		System.out.println("===== 운세 전체 출력 ======");
		for (int i = 0; i < fortuneDtos.size(); i++) {
			System.out.println(i + ". " + fortuneDtos.get(i));
		}
	}
	
	// 하나의 운세 출력(read)
	public void getFortune(List<FortuneDto> fortuneDtos) {
		int randomIndex = random.nextInt(fortuneDtos.size());
		FortuneDto fDto = fortuneDtos.get(randomIndex);
		System.out.println("===========================================");
		System.out.println("================포춘쿠키 오픈!=================");
		System.out.println("🎊 " + fDto.getFortuneStr());
		System.out.println("===========================================");
	}
	
	// 메뉴에서 운세 저장(create)
	public String putFortune() {
		System.out.println("===============운세를 저장합니다.================");
		System.out.println("===============운세를 입력해주세요.===============");
		String fortuneStr = scanner.nextLine();
		// 운세를 저장한 포춘 인스턴스 생성 및 배열에 저장 => 리포지토리 클래스가 담당
		return fortuneStr;
	}

	
	
	
}
