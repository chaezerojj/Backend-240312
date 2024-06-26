package chapter07;

public class AttendanceGS {
	
	private String studentName;
	private String enterRoomTime;
	private String leavingRoomTime;
	
	

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getEnterRoomTime() {
		return enterRoomTime;
	}

	public void setEnterRoomTime(String enterRoomTime) {
		this.enterRoomTime = enterRoomTime;
	}

	public String getLeavingRoomTime() {
		return leavingRoomTime;
	}

	public void setLeavingRoomTime(String leavingRoomTime) {
		this.leavingRoomTime = leavingRoomTime;
	}
	
	@Override
	public String toString() {
		return "AttendanceGS [studentName=" + studentName + 
				", enterRoomTime= " + enterRoomTime + ", leavingRoomTime= " 
				+ leavingRoomTime + "]";
	}


	public static void main(String[] args) {
		AttendanceGS ags = new AttendanceGS();
		ags.setStudentName("김자바");
		ags.setEnterRoomTime("08:45");
		ags.setLeavingRoomTime("16:55");
		System.out.println(ags.toString());
		// 1. 생성자 사용
		// 2. 게더세터 사용
		
	}
}
