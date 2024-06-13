package chapter19;

// Object 클래스의 메소드
//? toString()
// - 인스턴스에 대한 정보를 문자열로 제공할 목적으로 정의한 것
// - >>인스터스 변수에 저장된 값들을 문자열로 표현한다는 뜻
// - 호출 시 클래스 이름과 16진수 해시코드로 된 인스턴스 메모리 주소값 반환함
//   (-> toString() 입력 시 출력되는 내용이 생략해도 나오는 것)


public class ObjectToString {
	
	public static void main(String[] args) {
		Card c1 = new Card();
		System.out.println(c1);
		System.out.println(c1.toString());
		// 참조변수 이름으로 콘솔에 출력하면 .toString()값이 생략해도 출력됨
	}
}








