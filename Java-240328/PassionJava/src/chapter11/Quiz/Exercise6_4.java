package chapter11.Quiz;
// 두 점 (x, y)와 (x1, y1)간의 거리 구하기
public class Exercise6_4 {
	public static double getDistance(int x, int y, int x1, int y1) {
		double a;
		int xx = x - x1;
		int yy = y - y1;
		a = Math.sqrt((xx * xx) + (yy * yy));
		return a;
	}
	
	
	
	public static void main(String[] args) {
		System.out.println(getDistance(1, 1, 2, 2));
	}

}
