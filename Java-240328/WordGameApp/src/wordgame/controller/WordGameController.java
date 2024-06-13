package wordgame.controller;

import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import wordgame.dto.WordGameDto;
import wordgame.service.WordGameService;
import wordgame.view.WordGameView;

public class WordGameController {
	private Scanner sc;
	private WordGameView wordgameView;
	private WordGameService wordgameService;

	public WordGameController(WordGameView wordgameView, WordGameService wordgameService) {
		this.sc = new Scanner(System.in);
		this.wordgameView = wordgameView;
		this.wordgameService = wordgameService;
	}
	
	// 앱 실행
	public void runApp() {
		while (true) {
			int choice;
			choice = wordgameView.getMenu();
			switch(choice) {
			case 1:
				// 영단어 전체 보기
				break;
			case 2:
				// 영단어 등록
				break;
			case 3:
				// 영단어 삭제
				break;
			case 4:
				// 영단어 수정
				break;
			case 5:
				// 영단어 게임
				break;
			case 6:
				// 영단어 파일 저장
				break;
			case 7:
				// 종료
				System.out.println("= The End =");
				return;
			default:
				break;
			}
		}
	}
	
	// 영단어 전체 보기
	public void getWordList() {
		List<WordGameDto> wordList = wordgameService.getWordGameDtos();
		wordgameView.getWords(wordList);
	}
	
	// 영단어 등록 - Create
	public void createWord() {
		try {
			WordGameDto newWord = wordgameView.putWord();
			String engWord = newWord.getWordEng();
			// 중복된 단어인지 확인
			for (WordGameDto existingEngWord : wordgameService.getWordGameDtos()) {
				if (existingEngWord.getWordEng() == engWord) {
					wordgameView.getMessage("이미 존재하는 영어단어입니다.");
					return;
				}
			}
			wordgameService.createBook(newWord);
			wordgameView.getMessage("영단어가 추가되었습니다.");
		} catch (Exception e) {
			wordgameView.getMessage("오류가 발생하였습니다. " + e.getMessage());
		}
	}
	
	// 영단어 수정 - Update
	public void updateWord() {
		try {
			getWordList();
			String updateEngWord = wordgameView.getUpdateEng();
			String engWord = updateEngWord;
			WordGameDto updateWord = wordgameView.getUpdateWord();
			
			// 수정할 단어 저장 여부 확인
			boolean saveChanges = wordgameView.askForUpdateWord();
			if (!saveChanges) {
				wordgameView.getMessage("단어 수정이 취소되었습니다.");
				return;
			}
			if (wordgameService.isValidWord(engWord)) {
				wordgameService.updateWord(engWord, updateEngWord);
				System.out.println("영단어 정보가 정상적으로 수정되었습니다.");
			}
		} catch(Exception e) {
			wordgameView.getMessage("유효한 값이 아닙니다.");
		}
	}
	
	// 영단어 삭제 - Delete
	public void deleteWord() {
		try {
			getWordList();
			String engWord = wordgameView.getDeleteWord();
			String word = engWord;
			
			if (wordgameService.isValidWord(word)) {
				wordgameService.deleteWord(word);
				wordgameView.getMessage("영단어가 삭제되었습니다.");
			}
		} catch (Exception e) {
			wordgameView.getMessage("입력이 잘못되었습니다.");
		}
	}
	
	// 영단어 맞추기 게임 - 레벨을 입력받아서 진행
	private void wordGame() {
		String levelType = wordgameView.getWordGame();
		
	}
	
	

}
