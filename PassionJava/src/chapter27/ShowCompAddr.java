package chapter27;

public class ShowCompAddr {

	// 친구 회사 근처에서 점심을 먹기로 했다.
	// 친구 회사 주소를 보여주는 메소드 작성
	public void showCompAdder(Friend f) {
		String addr = null;
		if (f != null) {
			Company com = f.getCmp();
			// 70%는 일을 쉬고 있어서 회사 정보가 없음
			if (com!=null) {
				ContInfo info = com.getcInfo();
				if (info != null) { // 회사 주소를 모르거나 없을 경우
					addr = info.getAdrs();
				}
			}
			// 위의 코드에서 주소 정보를 얻지 못했을 수도 있음
			if (addr != null) {
				System.out.println(addr);
			} else {
				System.out.println("There's no address information.");
			}
		}
		
	}
	
	public static void main(String[] args) {
		// NullPointerException 예외의 발생 상황이 실제로 꽤 많음
		// null 가능성에 대비하는 코드 작성은 번거로움 + 코드 내용도 만족스럽지 X
		// >> Optional 클래스로 간편하게 해결
		
		
	}
	

}
