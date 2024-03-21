package chapter18;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

//? 예외 처리
// 프로그램에서 예외가 발생했을 경우 프로그램의 갑작스러운 종료를 막고,
// 정상 실행을 유지할 수 있도록 예외처리를 해야 함
// 실행 예외는 컴파일러가 체크해주지 않기 때문에 개발자의 경험을 바탕으로
// 예외 처리 코드를 작성해야 함
/*
 * try {
 * 
 * } catch(Exception e) {
 * 		예외처리코드
 * } finally { // 항상 실행, finally는 생략 가능
 * }
 * */
// 예외가 발생될 수 있는 가능성이 많은 코드는
// try-catch블록으로 강제적으로 감싸게 되어 있음
public class TryCatchFinallyExample {
	public static void main(String[] args) {
		File file = new File("test.txt");
		try {
			FileReader fileReader = new FileReader(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
 