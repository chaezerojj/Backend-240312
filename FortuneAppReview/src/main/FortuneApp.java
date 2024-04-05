package main;

import controller.FortuneController;
import service.FortuneRepository;

public class FortuneApp {
	
	public static void main(String[] args) {
		// 앱 시작
		FortuneController fController = 
				new FortuneController(new FortuneRepository());
		
		// 포춘쿠키 운세들
		// - 저장된 많은 운세들 중 랜덤으로 하나를 출력함
		fController.createFortune("눈에 띄는 행동은 자제하라.");
		fController.createFortune("옛 친구에게 전화가 오리라.");
		fController.createFortune("매우 결과적으로 기분 좋은 하루가 될 것 같다.");
		fController.createFortune("지나친 음주는 정신건강에 좋지 않다는 것은 알죠?");
		fController.createFortune("돈은 들어오나 반흉반길의 하루이다.");
		fController.createFortune("남녀간의 일이 어찌 사사로우랴. 신중해라.");
		fController.createFortune("정의롭지 못하면서 어찌 남을 선도하랴.");
		fController.createFortune("능력 이상의 일을 하게 된다.");
		fController.createFortune("대지에 비가 내리고 바람이 고르게 부니 만물이 번창하리라.");
		fController.createFortune("대인관계에 신경을 써야 할 시기이다.");
		fController.createFortune("길을 나섰지만 길가엔 위험만이 도사리고 있으니 집에 있음이 좋으리라.");
		fController.createFortune("친구들과의 갈등이 우려된다. 조심하라.");
		fController.createFortune("불분명한 행동은 주위로부터 신용을 잃게 된다.");
		fController.createFortune("불확실한 일은 추진하지도 마라.");
		fController.createFortune("많은 이득을 바라려 하니 부정한 방법이라 양심에 가책을 느끼게 된다.");
		fController.createFortune("여행을 떠나라. 귀인을 만나리라.");
		fController.createFortune("시작부터 모든 것이 잘 되지 않는다.");
		fController.createFortune("귀하의 노력이 있었으니 좋은 성적을 거두든 것은 당연하다.");
		fController.createFortune("일손을 놓고 쉬고 있을 때가 아니다.");
		fController.createFortune("어렵게 곤경을 빠져나오니 이번엔 또 다른 역경이 기다리고 있다.");
		fController.createFortune("살아갈 날이 적막한 터널과 다를 것이 없다.");
		fController.createFortune("용기 있는 사람이 얻는 것이 생긴다.");
		fController.createFortune("어두운 듯하지만 전혀 걱정할 것은 없다.");
		fController.createFortune("상대와 말을 나눌 때는 언제나 상대방의 입장도 한번쯤은 헤아려주는 아량이 필요하다.");

		// 저장한 운세들을 전체 출력해보기 - Read
//		fController.getFortunesAll();
		
		fController.runApp();
		
		
	}
}
