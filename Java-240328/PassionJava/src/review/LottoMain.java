package review;

public class LottoMain {
	public static void main(String[] args) {
		// 로또 랜덤 번호 6개 생성
		LottoController lottoController = new LottoController();
		lottoController.getLottoNums();
		// 로또 번호 한 세트 출력
		lottoController.printLottoNums();
	}
}
