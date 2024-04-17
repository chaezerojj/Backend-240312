package wordgame.view;

import java.util.List;
import java.util.Scanner;

import wordgame.dto.WordGameDto;

public class WordGameView {
	private Scanner sc;
	
	public WordGameView() {
		this.sc = new Scanner(System.in);
	}

	public int getMenu() {
		System.out.println("☆☆ 영단어 맞추기 게임 ☆☆");
		System.out.println("1. 영단어 전체 보기");
		System.out.println("2. 영단어 등록");
		System.out.println("3. 영단어 삭제");
		System.out.println("4. 영단어 수정");
		System.out.println("5. 영단어 게임");
		System.out.println("6. 영단어장 파일 저장");
		System.out.println("7. 종료");
		System.out.println("메뉴를 선택하세요 >> ");
		int choice = -1;
		
		try {
			choice = sc.nextInt();
			
			if (choice < 1 || choice > 7) {
				throw new IllegalArgumentException("메뉴에 있는 번호를 입력해주세요. (1~7)");
			}
		} catch (Exception e) {
			System.out.println("잘못된 입력입니다. 숫자를 입력해주세요.");
			sc.nextLine();
		}
		return choice;
	}
	
	// 전체 영단어 목록 출력
	public void getWords(List<WordGameDto> wordList) {
		System.out.println("-전체 영단어 리스트-");
		for (WordGameDto word : wordList) {
			System.out.println(word);
		}
	}
	
	// 사용자로부터 새로운 영단어를 입력받아 Dto 객체 생성하여 반환하기
	public WordGameDto putWord() {
		System.out.println("영어 단어를 입력해주세요.");
		System.out.println("입력은 영어 - 한국어 순서입니다.");
		while (true) {
			try {
				System.out.println(">> 영어 입력: ");
				String engWord = sc.nextLine();
				System.out.println(">> 뜻(한국어) 입력: ");
				String korWord = sc.nextLine();
				
				return new WordGameDto(engWord, korWord);
				
			} catch (Exception e) {
				e.getMessage();
			}
		}
	}
	
	// 메시지 출력 메소드
	public void getMessage(String message) {
		System.out.println(message);
	}
	
	// 사용자로부터 수정하고 싶은 영단어의 입력을 받음
	public String getUpdateEng() {
		System.out.println("영단어를 수정합니다.");
		System.out.println("수정하고 싶은 단어(영어)를 입력하세요. >> ");
		String engWord = sc.nextLine();
		return engWord;
	}
	
	// 수정할 영단어 정보를 입력 받음
	public WordGameDto getUpdateWord() {
		System.out.println("수정할 단어를 입력하세요. >> ");
		System.out.println("영어: ");
		String engWord = sc.nextLine();
		System.out.println("뜻(한국어): ");
		String korWord = sc.nextLine();
		return new WordGameDto(engWord, korWord);
	}
	
	// 수정된 단어에 대한 저장을 확인함
	public boolean askForUpdateWord() {
		boolean isValidInput = false;
		System.out.println("수정된 정보를 저장하시겠습니까? (y / n)");
		String input = sc.nextLine().trim().toLowerCase();
		if (input.equals("y")) {
			isValidInput = true;
		} else if (input.equals("n")) {
			isValidInput = false;
		} else {
			System.out.println("입력값이 잘못되었습니다.");
		}
		return isValidInput;
	}
	
	// 사용자로부터 삭제하고 싶은 단어를 입력받음
	public String getDeleteWord() {
		System.out.println("영단어를 삭제합니다.");
		System.out.println("삭제할 단어(영어)를 입력하세요. >>");
		String engWord = sc.nextLine();
		return engWord;
	}
	
	// 영단어 맞추기 게임
	public String getWordGame() {
		System.out.println("영단어 맞추기 게임을 시작합니다!");
		System.out.println("랜덤으로 제공되는 5개의 영어단어의 뜻을 맞추는 게임입니다.");
		System.out.println("레벨을 선택해주세요. (easy / hard)");
		String level = sc.nextLine();
		return level;
	}
	
	// 영단어 리스트를 파일로 저장
	public boolean getSaveFile() {
		boolean isValidInput = false;
		boolean saveFile = false;
		while (!isValidInput) {
			System.out.println("영단어 리스트를 파일로 저장하시겠습니까? (y / n)");
			sc.nextLine();
			String input = sc.nextLine().trim().toLowerCase();
			if (input.equals("y")) {
				saveFile = true;
				isValidInput = true;
			} else if (input.equals("n")) {
				saveFile = false;
				isValidInput = true;
			} else {
				System.out.println("입력이 잘못되었습니다. 다시 입력해주세요.");
			}
		} return saveFile;
	}

}
