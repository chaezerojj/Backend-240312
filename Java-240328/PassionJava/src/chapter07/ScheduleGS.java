package chapter07;

public class ScheduleGS {
	int month;
	int date;
	String todo;
	boolean check;

	
	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public int getDate() {
		return date;
	}


	public void setDate(int date) {
		this.date = date;
	}


	public String getTodo() {
		return todo;
	}


	public void setTodo(String todo) {
		this.todo = todo;
	}


	public boolean isCheck() {
		return check;
	}


	public void setCheck(boolean check) {
		this.check = check;
	}

	@Override
	public String toString() {
		return "ScheduleGS [" + month + "월 " + date + "일 할 일 목록 : " + todo + ", 완료 : " + check + "]";
	}
	
	public static void main(String[] args) {
		ScheduleGS s1 = new ScheduleGS();
		s1.setMonth(3);
		s1.setDate(18);
		s1.setTodo("자바 공부하기");
		s1.setCheck(true);
		System.out.println(s1.toString());
		
	}

}
