package chapter22;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

//? 성능 향상 보조 스트림
// - 프로그램이 입출력 소스와 직접 작업하지 않고 중간에
//   메모리 버퍼와 작업함으로써 실행 성능 향상
// - 프로그램 > 메모리 버퍼 > 하드 디스크

public class AboutBuffer {
	
	public static void main(String[] args) {
//		String ofp = 
//				AboutBuffer.class.getResource("apple.jpg").getPath();
//		System.out.println(ofp);
		try(FileInputStream fis = new FileInputStream("apple.jpg");
				FileOutputStream fos = new FileOutputStream("appleCopy.jpg"))
		{
			BufferedInputStream bis = new BufferedInputStream(fis);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			int data = -1;
			while(true) {
				data = bis.read();
				if (data == -1) break;
				bos.write(data);
			}
			bos.flush();
			System.out.println("파일 복사 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
