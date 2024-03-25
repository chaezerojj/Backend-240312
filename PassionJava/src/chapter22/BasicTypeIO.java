package chapter22;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

// 기본 타입 입출력 보조 스트림
// - DataInputStream, DataOutputStream
// - 사용하면 기본 타입 크기로 묶어서 입출력 해줌 + 버퍼 기능
// - 프로그램에 영구 저장해야 될 데이터 > 데이터 베이스 사용
// - 웹 애플리케이션 - 파일 라이브러리 사용하여 사용자가 파일 업로드한 것을 처리

public class BasicTypeIO {
	
	public static void main(String[] args) {
		// 기본 타입 입출력
		try(FileOutputStream fos = new FileOutputStream("primitive.dat");) {
			// 보조 스트림 연결
			DataOutputStream dos = new DataOutputStream(fos);
			// 기본 타입 값 출력
			dos.writeUTF("I love java"); // string타입 
			dos.writeDouble(3.14);
			dos.writeInt(1);
			dos.flush();
			System.out.println("데이터 저장 완료!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		try (FileInputStream fis = new FileInputStream("primitive.dat");){
			DataInputStream dis = new DataInputStream(fis);
			String name = dis.readUTF();
			double score = dis.readDouble();
			int order = dis.readInt();
			System.out.println(name + ":" + score + ":" + order);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
