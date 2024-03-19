package chapter11;
// 두 점 (x, y)와 (x1, y1)간의 거리 구하기
public class Exercise6_4 {
	public static double getDistance(int x, int y, int x1, int y1) {
		double a;
		int xx;
		int yy;
		xx = (int) Math.pow((x1-x), 2);
		yy = (int) Math.pow((y1-y), 2);
		a = Math.sqrt(xx+yy);
		return a;
	}
	
	
	
	public static void main(String[] args) {
		System.out.println(getDistance(1, 1, 2, 2));
	}

}
