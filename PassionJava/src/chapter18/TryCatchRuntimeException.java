package chapter18;

public class TryCatchRuntimeException {
	
	public static void main(String[] args) {
		String data1 = null;
//		String data1 = "string data1";
		try {
			System.out.println("예외 발생 전 코드");
			System.out.println(data1.toString());
			System.out.println("예외 발생 후 코드");
		} catch (NullPointerException e) {
//			e.printStackTrace();
			System.out.println("null값이 대입되어 있습니다.");
		}
		System.out.println("프로그램종료");
	}
}
