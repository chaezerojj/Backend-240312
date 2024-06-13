package chapter22;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

//? 스트림(Stream)
// - 단일 방향으로 연속적으로 흘러가는 것
// - 데이터를 읽고 출력하기 위해 사용됨
// * 입출력 스트림의 종류
// - java.io 패키지에는 여러 종류의 스트림 클래스 제공
// - 1. 바이트 기반 스트림: 그림, 멀티미디어 등의 바이너리 데이터를 읽고 출력할 대 사용
// - 2. 문자 기반 스트림: 문자 데이터를 읽고 출력할 때 사용

public class AboutStream {
	// 바이트 출력 스트림: OutputStream
	// - 상속하고 있는 클래스
	//   : FileOutputStream, PrintStream, BufferOutputStream, DataOutputStream
	public static void main(String[] args) {
		// 파일 출력 스트림: FileOutputStream(파일주소값)
		OutputStream os = null;
		try {
			os = new FileOutputStream("test1.dat");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		byte a = 10;
		byte b = 20;
		byte c = 30;
		
		try {
			os.write(a);
			os.write(b);
			os.write(c);
			// 출력 버퍼에 잔류하는 모든 바이트를 출력
			os.flush();
			// 출력 스트림을 닫음
			os.close();
			System.out.println("파일 쓰기 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// write(byte[] b) 메소드
		try {
			os = new FileOutputStream("test2.dat");
			byte[] array = {10, 20, 30};
			os.write(array);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// write(byte[] b, int off, int len) 메소드
		// b[off]부터 len개의 바이트 출력스트림으로 보냄
		
		
		
		
	}
	
	
}
