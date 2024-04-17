package wordgame.dto;

public class WordGameDto {
	private String wordEng;
	private String wordKor;
	
	public WordGameDto(String wordEng, String wordKor) {
		this.wordEng = wordEng;
		this.wordKor = wordKor;
	}

	public String getWordEng() {
		return wordEng;
	}

	public void setWordEng(String wordEng) {
		this.wordEng = wordEng;
	}

	public String getWordKor() {
		return wordKor;
	}

	public void setWordKor(String wordKor) {
		this.wordKor = wordKor;
	}

	@Override
	public String toString() {
		return "WordGameDto [Eng=" + wordEng + ", Kor=" + wordKor + "]";
	}
	
	
}
