package wordgame.service;

import java.util.ArrayList;
import java.util.List;

import wordgame.dto.WordGameDto;

public class WordGameRepository implements WordGameService {
	private List<WordGameDto> wordgameDtos;
	
	public WordGameRepository() {
		this.wordgameDtos = new ArrayList<>();
	}
	
	// 영단어 목록
	// easy ver.
	public void easyWordData() {
		wordgameDtos.add(new WordGameDto("easy", "쉬운"));
	}
	
	// hard ver.
	public void hardWordData() {
		wordgameDtos.add(new WordGameDto("hard", "어려운"));
	}

	@Override
	public List<WordGameDto> getWordGameDtos() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createBook(WordGameDto newWord) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValidWord(String engWord) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateWord(String engWord, String updateEngWord) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteWord(String word) {
		// TODO Auto-generated method stub
		
	}
	
	// 전체 영단어 리스트 출력
	
}
