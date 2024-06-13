package book.view;

import java.util.*;

import book.dto.BookDto;

// 콘솔 view 클래스
public class BookView {
	private Scanner sc;

	public BookView() {
		this.sc = new Scanner(System.in);
	};

	// 사용자에게 메뉴를 표시하고, 사용자가 선택한 메뉴의 번호를 반환
	public int getMenu() {
		System.out.println("☆★☆★ 도서관리 프로그램 ☆★☆★");
		System.out.println("1. 전체 도서 목록");
		System.out.println("2. 도서 등록");
		System.out.println("3. 도서 정보 수정");
		System.out.println("4. 도서 삭제");
		System.out.println("5. 도서 검색");
		System.out.println("6. 도서 목록 파일 저장");
		System.out.println("7. 종료");
		System.out.println("메뉴 선택 >> ");
		int choice = -1;

		// 정해진 정수 이외의 값이 들어왔을 때 예외 처리
		try {
			choice = sc.nextInt();

			if (choice < 1 || choice > 7) {
				throw new IllegalArgumentException
				("메뉴 번호(1~7)를 입력해주세요.");
			}
		} catch (Exception e) {
			System.out.println("잘못된 입력입니다. 숫자를 입력해주세요.");
			sc.nextLine(); // 입력 버퍼 비우기
		}
		return choice;
	}

	// 전체 도서 목록 출력
	public void printBooks(List<BookDto> bookList) {
		System.out.println("☆★☆★ 전체 도서 목록 ☆★☆★");
		for (BookDto book : bookList) {
			System.out.println(book);
		}
	}

	// 사용자로부터 새로운 도서 정보를 입력받아서 BookDto 객체를 생성하여 반환
	public BookDto putBook() {
		System.out.println("도서 정보를 입력해주세요.");
		while (true) {
			try {
				System.out.println(">> 도서 번호 입력: ");
				int bookIndex = sc.nextInt();
				sc.nextLine();
				if (bookIndex <= 0) {
					throw new IllegalArgumentException
					("도서 인덱스는 1이상의 정수부터 시작합니다.");
				}
				System.out.println(">> 도서명 입력: ");
				String bookName = sc.nextLine();
				System.out.println(">> 도서 저자 입력: ");
				String bookAuthor = sc.nextLine();
				System.out.println(">> 도서 출판사 입력: ");
				String bookPublisher = sc.nextLine();
				System.out.println(">> 도서 대여 여부: ");
				String bookRental = sc.nextLine();
				System.out.println(">> 도서 카테고리 입력: ");
				String bookCategory = sc.nextLine();

				return new BookDto(bookIndex, bookName, bookAuthor, 
						bookPublisher, bookRental, bookCategory);
			} catch (InputMismatchException e) {
				getMessage(e.getMessage());
				sc.nextLine();
			} catch (IllegalArgumentException e) {
				getMessage(e.getMessage());
			} catch (Exception e) {
				getMessage("예상하지 못한 오류가 발생했습니다." + e.getMessage());
			}
		}
	}

	// 메시지 출력 메소드
	public void getMessage(String message) {
		System.out.println(message);
	}

	// 사용자로부터 수정할 도서의 인덱스 값을 입력받음
	public int getUpdateIndex() {
		System.out.println("도서 정보를 수정합니다.");
		System.out.println("수정할 도서의 인덱스를 입력하세요. >>");
		int index = sc.nextInt();
		sc.nextLine();
		return index;
	}

	// 수정할 도서 정보를 받는 메소드
	public BookDto getUpdateBook() {
		System.out.println("수정할 도서 정보를 입력하세요.");
		System.out.println("인덱스: ");
		int index = sc.nextInt();
		sc.nextLine();
		System.out.println("도서명: ");
		String name = sc.nextLine();
		System.out.println("저자: ");
		String author = sc.nextLine();
		System.out.println("출판사: ");
		String publisher = sc.nextLine();
		System.out.println("대여 가능 여부: ");
		String isRental = sc.nextLine();
		System.out.println("카테고리: ");
		String category = sc.nextLine();
		return new BookDto(index, name, author, 
				publisher, isRental, category);
	}

	// 수정 내용에 대한 저장 여부를 확인하는 메소드
	public boolean askForUpdateBook() {
		boolean isValidInput = false;
		System.out.println("수정된 도서 정보를 저장하시겠습니까? (y / n)");
		String input = sc.nextLine().trim().toLowerCase();
		if (input.equals("y")) {
			isValidInput = true;
		} else if (input.equals("n")) {
			isValidInput = false;
		} else {
			System.out.println("잘못된 입력입니다.");
		}
		return isValidInput;
	}

	// 사용자로부터 삭제할 도서의 인덱스 값을 입력받음
	public int getDeleteIndex() {
		System.out.println("도서 정보를 삭제합니다.");
		System.out.println("삭제할 도서의 인덱스를 입력하세요. >>");
		int index = sc.nextInt();
		sc.nextLine();
		return index;
	}

	// 사용자로부터 검색할 도서 타입을 입력받음
	public int getSearchType() {
		System.out.println("검색할 타입을 선택하세요.");
		System.out.println("1:도서명 | 2:저자 ");
		int searchType = sc.nextInt();
		sc.nextLine();
		return searchType;
	}

	// 검색 세부: 타입 입력 받은 후 해당 타입의 검색어 입력 받음
	public String getSearchStr() {
		System.out.println("검색어를 입력하세요.");
		return sc.nextLine();
	}

	// 작성된 도서 정보를 파일로 저장
	public boolean getSaveFile() {
		// 사용자가 y 입력: true 반환, n 입력: false 반환
		boolean isValidInput = false; // y/n 입력값
		boolean saveFile = false; // 파일 저장
		while (!isValidInput) {
			System.out.println("작성된 도서 목록 전체를 파일로 저장하시겠습니까? (y / n)");
			sc.nextLine();
			String input = sc.nextLine().trim().toLowerCase(); 
			// trim() : 입력값 앞뒤 공백 제거
			if (input.equals("y")) {
				saveFile = true; // 파일 저장
				isValidInput = true; // 입력값 제대로 받음
			} else if (input.equals("n")) {
				saveFile = false; // 파일은 저장되지 않음
				isValidInput = true; // 입력값 제대로 받음
			} else {
				System.out.println("잘못된 입력입니다. 다시 입력해주세요.");
			}
		}
		return saveFile;
	}

}