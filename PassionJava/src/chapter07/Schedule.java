package chapter07;

//일정 관리 프로그램 
public class Schedule {
	int month;
	int date;
	String todo;
	boolean check;
	
	public void setSchedule(int m, int d, String td, boolean c) {
		month = m;
		date = d;
		todo = td;
		check = c;
	}
	public void getSchedule() {
		System.out.println("====오늘의 일정====");
		System.out.println("< " + month +"월 " + date + "일 " + "할 일 목록 >");
		System.out.println("- " + todo);
		System.out.println("해당일정 완료: " + check);
	}
	
	
	public static void main(String[] args) {
		Schedule schedule1 = new Schedule();
		schedule1.setSchedule(3, 18, "은행 가기", true);
		schedule1.getSchedule();
	}

}
