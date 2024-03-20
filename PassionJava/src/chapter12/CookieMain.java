package chapter12;

//? 다형성 활용
// - 자료 구조를 하나로 처리
// - 메소드 매개변수에 하나의 자료형의 처리
// - 오버라이딩한 메소드를 호출할 때 각각의 클래스에 덮어씌운 메소드 실행됨

public class CookieMain {
	Cookie[] cookieArr = new Cookie[3];
	private int cnt = 0;
	
	public Cookie[] getCookieArr() {
		return cookieArr;
	}

	public void setCookieArr(Cookie[] cookieArr) {
		this.cookieArr = cookieArr;
	}
	
	public void putCookieArr(Cookie cookie) {
		cookieArr[cnt++] = cookie;
	}

	public static void main(String[] args) {
		CookieMain cookieMain = new CookieMain();
//		Cookie[] cookieArr = cookieMain.getCookieArr();
		Cookie cookie = new CreamChocoCookie();
		cookieMain.putCookieArr(cookie);
		cookieMain.putCookieArr(new ChocoCookie());
		cookieMain.putCookieArr(new Cookie());
		
		
		Cookie[] cArr = cookieMain.getCookieArr();
		for(int i = 0; i < cArr.length; i++) {
			cArr[i].whoAreYou();
			// 가지고 있는 함수 몸체가 실현됨
			// It's a CreamChocoCookie.
			// It's a ChocoCookie.
			// It's a Cookie.

		}
		
		// 참조변수의 형변환
		// - 서로 상속관계에 있는 타입간의 형변환은 양방향으로 자유롭게 수행 가능
		
		cArr[0].whoAreYou(); // It's a CreamChocoCookie.
//		cArr[0].getCream(); // error- undefined
		// Cookie[]으로 선언했기 때문에 하위자료형으로 선언해두고 사용해야 함
		// Cookie[] cookieArr
		// cookieArr[0] = new CreamChocoCookie();
		CreamChocoCookie ccc = (CreamChocoCookie)(cArr[0]); // 형변환하여 넣기
		ccc.getCream(); // Cream flavor: 생크림
		
		
	}

}
