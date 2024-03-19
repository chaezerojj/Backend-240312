package chapter11;

// 멤버변수를 갖는 Student 클래스 정의
public class Exercise6_2 {

	public static void main(String[] args) {
		Student s = new Student("홍길동", 1, 1, 100, 68, 76);
		
		String str = s.info();
		System.out.println(str);
	}
	
	static class Student {
		String name;
		int ban;
		int no;
		int kor;
		int eng;
		int math;

		public Student(String name, int ban, int no, int kor, int eng, int math) {
			this.name = name;
			this.ban = ban;
			this.no = no;
			this.kor = kor;
			this.eng = eng;
			this.math = math;
		}
		
		public String info() {
			return name + ", " + ban + ", " + no + ", " + kor + ", " + eng + ", " + math;
		}
		
	}


}
