package chapter19;

import java.util.Calendar;

public class Calendar001 {

	public static void main(String[] args) {
		// 기본적으로 현재 날짜와 시간으로 설정됨
		Calendar today = Calendar.getInstance();
		System.out.println("올해 연도: " + today.get(Calendar.YEAR));
		System.out.println("월(0 ~ 11, 0=1월): " + today.get(Calendar.MONTH));
		// 0=1월, 1=2월, 2=3월, ... , 10=11월, 11=12월
		System.out.println("이 해의 주: " + today.get(Calendar.WEEK_OF_YEAR));
		System.out.println("이 달의 주: " + today.get(Calendar.WEEK_OF_MONTH));
		System.out.println("이 달의 일: " + today.get(Calendar.DATE));// DATE와 DAY_OF_MONTH는 같음
		System.out.println("이 달의 몇일: " + today.get(Calendar.DAY_OF_MONTH));
		System.out.println("이 해의 몇일: " + today.get(Calendar.DAY_OF_YEAR));
		System.out.println("요일(1 ~ 7, 1=일요일): " + today.get(Calendar.DAY_OF_WEEK));
		// 1: 일요일, 2: 월요일, ... , 7: 토요일
		System.out.println("오전_오후(0=오전, 1=오후): " + today.get(Calendar.AM_PM));
		System.out.println("시간(0 ~ 11): " + today.get(Calendar.HOUR) + "시");
		System.out.println("시간(0 ~ 23): " + today.get(Calendar.HOUR_OF_DAY) + "시");
		System.out.println("분(0 ~ 59): " + today.get(Calendar.MINUTE) + "분");
		System.out.println("초(0 ~ 59): " + today.get(Calendar.SECOND) + "초");
		System.out.println("이 달의 마지막 날: " + today.getActualMaximum(Calendar.DATE));
		
	}
}
