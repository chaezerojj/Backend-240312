package chapter20;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
// import java.util.*;
// * - all(모든 것)을 의미
// - => java.util 패키지 안에 있는 모든 클래스를 임포트

//? SimpleDateFormat클래스
// - Date나 Calendar만으로 날짜 데이터를 원하는 형태로 다양하게 출력하는 것은 불편하고 복잡
// - Java API 문서에서 SimpleDateFormat 표 참조
// - https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html


public class SimpleDateFormatClass {
	public static void main(String[] args) {
		Date today = new Date();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(today);
		System.out.println(sdf1.format(today));
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy년 MM월 dd일 E요일");
		System.out.println(sdf2.format(today));
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); // 시간 출력
		System.out.println(sdf3.format(today)); // 밀리초까지 나옴
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a"); // 시간+오전오후 출력
		System.out.println(sdf4.format(today)); 
		
		// parse(String source)
		// - 문자열을 날짜 인스턴스로 변환해줌
		// DateFormat
		// - 추상 클래스로 SimpleDateFormat이 DateFormat을 구현하는 클래스
		
		DateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
		try {
			Date d = df.parse("2019년 11월 23일"); // 해당 문장은 try-catch로 감싸주어야 함
			System.out.println(d);
			System.out.println(df.format(d));
		} catch (ParseException e) {
			// printStackTrace - 예외 발생된 라인을 추적해 콘솔 출력
			e.printStackTrace();
			// getMessage - 예외 메시지를 콘솔에 출력
			e.getMessage();
		}
		System.out.println("프로그램 종료");
		
		
		
		
		
		
	}
}







