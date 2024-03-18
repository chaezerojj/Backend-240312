package chapter07;

// 출석 관리 프로그램
// 변수 앞에 private, 메소드 앞에 public
public class Attendance {
	private String studentName;
	private String enterRoomTime;
	private String leaveRoomTime;
	
	public void setAttendance(String s, String e, String l) {
		studentName = s;
		enterRoomTime = e;
		leaveRoomTime = l;
	}
	
	public void getAttendance() {
		System.out.println("훈련생 이름: " + studentName);
		System.out.println("입실 시간: " + enterRoomTime);
		System.out.println("퇴실 시간: " + leaveRoomTime);
	}
	
	public static void main(String[] args) {
		Attendance attendance1 = new Attendance();
		attendance1.setAttendance("김자바", "08:30", "16:50");
		attendance1.getAttendance();
		Attendance attendance2 = new Attendance();
		attendance2.setAttendance("김클래스", "08:50", "16:53");
		attendance2.getAttendance();
		
	}

}

