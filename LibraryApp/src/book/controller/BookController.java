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
	private List<BookDto> bookList;
	private Scanner sc;

	public BookController(BookService bookService) {
		this.bookView = new BookView();
		this.bookService = bookService;
		this.sc = new Scanner(System.in); // 숫자 입력(인덱스)
		this.bookList = new ArrayList<>();
	}

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
				searchBook();
				break;
			case 6:
				// 종료
				return;
			default:
				bookView.getMessage("잘못된 입력입니다. 숫자를 입력해주세요.");
				break;
			}
		}
	}

	// 도서 목록
	public void getBookList() {
		List<BookDto> bookList = bookService.getBookDtos();
		System.out.println("현재 도서 목록입니다. =======");
		bookView.getBookList(bookList);
	}

	// 도서 등록 - create
	public void createBook() {
		BookDto newBook = bookView.putBook();
		bookService.createBook(newBook);
		bookView.getMessage("도서 정보가 등록되었습니다. ===");
	}


	// 도서 수정 - update
	public void updateBook() {
		getBookList();
		int updateIndex = bookView.getUpdateIndex();
		BookDto updateBook = bookView.getUpdateBook();

		if (bookService.isValidIndex(updateIndex)) {
			// 유효한 인덱스 값일때만 수정
			bookService.updateBook(updateIndex, updateBook);
			bookView.getMessage("도서 정보가 수정되었습니다.");
		} else {
			bookView.getMessage("유효한 인덱스값이 아닙니다.");
		}

	}

	// 도서 삭제 - delete (인덱스 입력 시 도서 삭제)
	public void deleteBook() {
		getBookList();
		bookView.getMessage("삭제할 도서의 인덱스를 입력하세요. >>");
		int bookIndex = sc.nextInt();
		sc.nextLine();

		if (bookService.isValidIndex(bookIndex)) {
			bookService.deleteBook(bookIndex);
		} else {
			bookView.getMessage("유효하지 않은 인덱스입니다.");
		}
	}


	// 도서 검색
	private void searchBook() {
		getBookList();
		bookView.getMessage("검색할 도서명을 입력하세요. >>");
		String name = bookView.getBookName(); 

		List<BookDto> searchBookName = bookService.searchBook(name);

		if (searchBookName == null || searchBookName.isEmpty()) {
			bookView.getMessage("검색결과가 없습니다.");
		} else {
			bookView.getBookList(searchBookName); // 검색 결과 출력
		}
	}



}
