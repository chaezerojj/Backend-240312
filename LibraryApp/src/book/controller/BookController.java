package book.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import book.dto.BookDto;
import book.service.BookService;
import book.view.BookView;

public class BookController {
	private BookView bookView;
	private BookService bookService;
	private Scanner scNum;
	private Scanner scStr;
	
	public BookController(BookService bookService) {
		this.bookView = new BookView();
		this.bookService = bookService;
		Scanner scNum = new Scanner(System.in); // 숫자 입력(인덱스)
		Scanner scStr = new Scanner(System.in); // 문자 입력(이름, 저자, 출판사, 카테고리)
	}
	
	// ArrayList에 도서 정보 추가
	ArrayList<Integer> index = new ArrayList<Integer>();
	ArrayList<String> name = new ArrayList<String>();
	ArrayList<String> author = new ArrayList<String>();
	ArrayList<String> publisher = new ArrayList<String>();
	ArrayList<String> category = new ArrayList<String>();
	
	// 앱 실행
	public void runApp() {
		
		int choice;
		while (true) {
			choice = bookView.getMenu();
			switch (choice) {
			case 1:
				// 전체 도서 목록
				getBookList();
				break;
			case 2:
				// 도서 등록
				createBook();
				break;
			case 3:
				// 도서 정보 수정
				updateBook();
				break;
			case 4:
				// 도서 삭제
				deleteBook();
				break;
			case 5:
				// 도서 검색
				break;
			case 6:
				// 종료
				break;
			default:
				bookView.getMessage("잘못된 입력입니다. 숫자를 입력해주세요.");
				break;
			}
		}
	}
	
	public void getBookList() {
		
		
	}

	// 도서 목록
	public void bookList() {
		List<BookDto> bookList = bookService.getBookDtos();
		bookView.getBookList(bookList);
	}
	
	// 도서 등록 - create
	public void createBook() {
		BookDto newBook = bookView.putBook();
		bookService.createBook(newBook);
	}
	
	// 도서 수정 - update
	public void updateBook() {
		bookList();
		bookView.getMessage("수정할 도서의 인덱스를 입력하세요. >>");
		int bookIndex = scNum.nextInt();
		scNum.nextLine();
		
		if(bookService.isValidIndex(bookIndex)) {
			BookDto updatedBook = bookView.putBook(); // 변수 
			bookService.updateBook(bookIndex, updatedBook);
		} else {
			bookView.getMessage("유효하지 않은 인덱스입니다.");
		}
	}
	
	// 도서 삭제 - delete (인덱스 입력 시 도서 삭제)
	public void deleteBook() {
		bookList();
		bookView.getMessage("삭제할 도서의 인덱스를 입력하세요. >>");
		int bookIndex = scNum.nextInt();
		scNum.nextLine();
		
		if(bookService.isValidIndex(bookIndex)) {
			bookService.deleteBook(bookIndex);
		} else {
			bookView.getMessage("유효하지 않은 인덱스입니다.");
		}
	}

	public void addBook() {
		//
	}

	
	
	
	
}
