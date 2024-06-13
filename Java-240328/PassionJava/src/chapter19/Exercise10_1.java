package chapter19;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class Exercise10_1 {

	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		date.set(2020, 0, 1);
		
		for (int i = 0; i < 12; i++) {
			int firstDay = date.get(Calendar.DAY_OF_WEEK);
			int secondSunday = (firstDay == 1) ? 8 : 16 - firstDay;
			
			date.set(Calendar.DAY_OF_MONTH, secondSunday);
			Date d = date.getTime();
			System.out.println(new SimpleDateFormat("yyyy-MM-dd은 F번째 E요일 입니다.").format(d));
			// 날짜를 다음달 1일로 변경 !!!!
			date.add(Calendar.MONTH, 1);
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		
		
	}

}
