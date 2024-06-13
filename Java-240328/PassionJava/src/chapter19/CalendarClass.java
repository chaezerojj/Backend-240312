package chapter19;

import java.util.Calendar;
import java.util.GregorianCalendar;

// 날짜와 시간
// Calendar 클래스

public class CalendarClass {
	
	public static void main(String[] args) {
		// - Calendar는 추상 클래스이기 때문에 직접 인스턴스를 생성할 수 없고,
		// 	 메소드를 통해서 인스턴스를 대입받음
//		Calendar cal = new Calendar(); // error - 추상클래스는 인스턴스를 생성할 수 없음
		Calendar cal = Calendar.getInstance();
		// getInstance()는 나라가 태국일때 BuddhistCalendar의 인스턴스를 반환
		// , 그 외에는 GregorianCalendar(그레고리력)의 인스턴스를 반환
		Calendar cal1 = new GregorianCalendar();
		// 만약, 특정 인스턴스를 생성하도록 프로그램이 작성되어
		// 다른 종류의 역법을 사용한 국가에서 실행 또는 새로운 역법이 추가되는 경우
		// => 즉, 다른 종류의 인스턴스를 필요로 하는 경우 코드 변경 필요
		
		
		
	}
}
