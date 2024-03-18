package chapter07;

// 운동 1개를 저장하는 클래스

public class Workout {
	private String name;
	private int set;
	private int times;
	private int rest;
	
	public void setWorkout(String n, int s, int t, int r) {
		 name = n;
		 set = s;
		 times = t;
		 rest = r;
	}
	
	public void getWorkout() {
		System.out.println("운동 이름: " + name);
		System.out.println("세트: " + set + "세트, 횟수: " + times + "회, 총 " + set*times + "회");
		System.out.println("휴식 시간: " + rest + "분");
		System.out.println();
	}
	
	
	public static void main(String[] args) {
		Workout workout1 = new Workout();
		workout1.setWorkout("레그레이즈", 3, 10, 10);
		workout1.getWorkout();
		Workout workout2 = new Workout();
		workout2.setWorkout("데드리프트", 3, 15, 10);
		workout2.getWorkout();
		
	}

}
