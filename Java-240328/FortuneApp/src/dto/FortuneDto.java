package dto;

// dto - data transfer object

// 운세 한문장 데이터를 저장하는 클래스
public class FortuneDto {

	private String fortuneStr; // 변수: 포춘 문장

	public String getFortuneStr() {
		return fortuneStr;
	}

	public void setFortuneStr(String fortuneStr) {
		this.fortuneStr = fortuneStr;
	}

	@Override
	public String toString() {
		return "FortuneDto [fortuneStr=" + fortuneStr + "]";
	}

}
