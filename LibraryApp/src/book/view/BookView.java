package book.view;

import java.util.*;

import book.dto.BookDto;

// 콘솔 view 클래스
public class BookView {
	private Scanner sc = new Scanner(System.in);
	
	// 사용자에게 메뉴를 표시하고, 사용자가 선택한 메뉴의 번호를 반환
	public int getMenu() {
		System.out.println("===========================");
		System.out.println("도서관리 프로그램입니다.");
		System.out.println(">> 메뉴 선택 <<");
		System.out.println("1. 전체 도서 목록");
		System.out.println("2. 도서 등록");
		System.out.println("3. 도서 정보 수정");
		System.out.println("4. 도서 삭제");
		System.out.println("5. 도서 검색");
		System.out.println("6. 종료");
		return sc.nextInt();
		
		// 정수 이외의 값 입력 시 예외 발생 코드
	}
	
	// 전체 도서 목록 출력
	public void getBookList(List<BookDto> bookList) {
		System.out.println("=== 전체 도서 목록 ===");
		for (BookDto book : bookList) {
			System.out.println(book);
		}
	}
	
	// 사용자로부터 새로운 도서 정보를 입력받아서 BookDto 객체를 생성하여 반환
	public BookDto putBook() {
		System.out.println("== 도서 정보를 입력해주세요. ==");
		while (true) {
			System.out.println(">> 도서 번호 입력: ");
			int bookIndex = sc.nextInt();
			System.out.println(">> 도서 제목 입력: ");
			String bookName = sc.nextLine();
			System.out.println(">> 도서 저자 입력: ");
			String bookAuthor = sc.nextLine();
			System.out.println(">> 도서 출판사 입력: ");
			String bookPublisher = sc.nextLine();
			System.out.println(">> 도서 카테고리 입력: ");
			String bookCategory = sc.nextLine();
			
			return new BookDto(bookIndex, bookName, bookAuthor, bookPublisher, bookPublisher, bookCategory);
		}
	}

	// 메시지 출력 메소드
	public void getMessage(String message) {
		System.out.println(message);
	}
	
	// 사용자로부터 수정할 도서의 인덱스 값을 입력받음
	public int getUpdateIndex() {
		System.out.println("도서 정보를 수정합니다. =====");
		System.out.println("수정할 도서의 인덱스를 입력하세요. =====");
		int index = sc.nextInt();
		sc.nextLine();
		return index;
	}
	
	// 사용자로부터 삭제할 도서의 인덱스 값을 입력받음
	public int getDeleteIndex() {
		System.out.println("도서 정보를 삭제합니다. =====");
		System.out.println("삭제할 도서의 인덱스를 입력하세요. =====");
		int index = sc.nextInt();
		sc.nextLine();
		return index;
	}
	
	// 도서 검색 메소드 - 사용자로부터 도서 제목을 입력받음
	public String searchBook() {
		System.out.println("도서 정보를 검색합니다.====");
		System.out.println("도서 제목을 입력해주세요. =====");
		String bookTitle = sc.nextLine();
		return bookTitle;
	}
	
	
	// 
}
