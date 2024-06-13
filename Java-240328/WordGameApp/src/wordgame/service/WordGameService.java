package wordgame.service;

import java.util.List;

import wordgame.dto.WordGameDto;

public interface WordGameService {

	List<WordGameDto> getWordGameDtos();

	void createBook(WordGameDto newWord);

	boolean isValidWord(String engWord);

	void updateWord(String engWord, String updateEngWord);

	void deleteWord(String word);

}
