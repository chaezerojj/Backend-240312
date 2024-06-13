package chapter12;

//? Instanceof 연산자
// - 참조변수가 참조하고 있는 인스턴스의 실제 타입을 알아보기 위해
// 	 instanceof 연산자를 사용
// - 참조변수가 대입 가능한 타입을 알아보는 연산자


public class InstanceType {

	public static void main(String[] args) {
		Cookie[] cArr = new Cookie[3];
//		Cookie cookie = new Cookie();
//		Cookie cookie = new ChocoCookie();
		Cookie cookie = new CreamChocoCookie();
		
//		Cookie cookie = cArr[0];
//		Cookie cookie = cArr[1];
//		Cookie cookie = cArr[2];
		
		if (cookie instanceof CreamChocoCookie) {
			System.out.println("실제 타입은 CreamChocoCookie");
		} else if (cookie instanceof ChocoCookie) {
			System.out.println("실제 타입은 ChocoCookie");			
		} else if (cookie instanceof Cookie) {
			System.out.println("실제 타입은 Cookie");
		}
		
		
		
		
	}

}






