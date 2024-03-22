package chapter19;

import java.text.*;
import java.util.*;

public class Exercise10_2 {

	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		String p1 = "yyyy/MM/dd";
		DateFormat df = new SimpleDateFormat(p1);
		String p2 = "입력하신 날짜는 E요일 입니다.";
		DateFormat df2 = new SimpleDateFormat(p2);

		Scanner scan = new Scanner(System.in);
		
		Date inDate = null;
		
		do {
			System.out.println("날짜를 " + p1 +"의 형태로 입력해주세요.");
			try {
			System.out.println(">> ");
			inDate = df.parse(scan.nextLine()); // 입력받은 날짜를 Date로 변환
			break;
		} catch (Exception e) {}
		 }while (true);
		
		System.out.println(df2.format(inDate));
	}

}
