package book.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import book.dto.BookDto;
import book.dto.BookList;
import book.service.BookService;
import book.view.BookView;

public class BookController {
	private Scanner sc;
	private BookView bookView;
	private BookService bookService;
	private BookDto originalBook; // updateBook - 수정 전 도서 정보를 저장하는 변수

	public BookController(BookService bookService, BookView bookView) {
		this.sc = new Scanner(System.in);
		this.bookView = bookView;
		this.bookService = bookService;
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
				// 지금까지 저장한 도서 목록 txt파일로 저장
				saveBookListFile();
				break;
			case 7:
				// 종료
				System.out.println("= 프로그램 종료 =");
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
		bookView.printBooks(bookList);
	}

	// 도서 등록 - create
	public void createBook() {
		try {
			BookDto newBook = bookView.putBook();
			int index = newBook.getIndex(); // 사용자 입력값과 목록 인덱스값을 맞춤
			// 중복된 인덱스인지 확인
			for (BookDto existingBook : bookService.getBookDtos()) {
				if (existingBook.getIndex() == index) {
					bookView.getMessage("이미 존재하는 인덱스는 등록할 수 없습니다.");
					return;
				}
			}
			// 도서 등록
			bookService.createBook(newBook);
			bookView.getMessage("도서가 등록되었습니다.");
		} catch (InputMismatchException e) {
			bookView.getMessage("잘못된 입력입니다. 숫자를 입력해주세요.");
			sc.nextLine();
		} catch (Exception e) {
			bookView.getMessage("예상하지 못한 오류가 발생했습니다: " + e.getMessage());
		}

	}

	// 도서 수정 - update
	public void updateBook() {
		try {
			getBookList();
			int updateIndex = bookView.getUpdateIndex();
			int index = updateIndex - 1; // 사용자가 보는 인덱스값과 실제 리스트 인덱스값을 맞춤
			originalBook = bookService.getBookDtos().get(index);

			BookDto updateBook = bookView.getUpdateBook();

			// 수정한 내용에 대한 저장 여부 확인
			boolean saveChanges = bookView.askForUpdateBook();
			if (!saveChanges) {
				bookView.getMessage("도서 정보 수정이 취소되었습니다.");
				return;
			}

			if (bookService.isValidIndex(index)) {
				// 유효한 인덱스 값일때만 수정
				bookService.updateBook(index, updateBook);
				bookView.getMessage("도서 정보가 수정되었습니다.");
			} else {
				bookView.getMessage("유효한 인덱스값이 아닙니다.");
			}
		} catch (Exception e) {
			bookView.getMessage("인덱스 숫자를 입력해주세요.");
		}
	}

	// 도서 삭제 - delete (인덱스 입력 시 도서 삭제)
	public void deleteBook() {
		try {
			getBookList();
			int bookIndex = bookView.getDeleteIndex();
			int index = bookIndex - 1; // 사용자 입력값과 목록 인덱스 값을 맞춤

			if (bookService.isValidIndex(index)) {
				bookService.deleteBook(index);
				bookView.getMessage("도서 정보가 삭제되었습니다.");
			} else {
				bookView.getMessage("유효하지 않은 인덱스입니다.");
			}
		} catch (Exception e) {
			bookView.getMessage("잘못된 입력입니다. 다시 입력해주세요.");
		}
	}

	// 도서 검색 - 타입 입력 받아서 검색
	private void searchBook() {
		int searchType = bookView.getSearchType();
		String searchStr = bookView.getSearchStr();

		List<BookDto> searchResult = null;

		switch (searchType) {
		case 1: // 도서명 검색
			searchResult = bookService.searchBookByName(searchStr);
			break;
		case 2: // 저자 검색
			searchResult = bookService.searchBookByAuthor(searchStr);
			break;
		default:
			bookView.getMessage("잘못된 입력입니다.");
			return;
		}

		if (searchResult != null) {
			boolean b = false;
			for (BookDto book : searchResult) {
				if (book != null) {
					List<BookDto> bookList = Arrays.asList(book);
					bookView.printBooks(bookList);
					b = true;
					break;
				}
			}
			if (!b) {
				bookView.getMessage("검색결과가 없습니다.");
			}
		} else {
			bookView.getMessage("검색결과가 없습니다.");
		}
	}

	// 현재까지 작성된 도서 정보들을 담아서 txt 파일로 만들기
	public void saveBookListFile() {
		try {
			boolean newFile = bookView.getSaveFile();
			if (newFile) {
				bookService.saveFile();
				bookView.getMessage("도서목록을 파일로 저장하였습니다.");
			} else {
				bookView.getMessage("파일 저장에 실패하였습니다.");
			}
		} catch (Exception e) {
			bookView.getMessage("파일 저장에 실패하였습니다.");
		}
	}

}
