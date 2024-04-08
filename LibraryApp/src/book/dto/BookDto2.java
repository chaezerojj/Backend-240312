package book.dto;

import java.util.List;

public class BookDto2 {
	private List<BookDto> bookList;

	// 주어진 도서목록으로부터 BookDto2 객체를 초기화
	public BookDto2(List<BookDto> bookList) {
		this.bookList = bookList;
	}

	// 현재 저장된 도서 목록을 반환
	public List<BookDto> getBookList() {
		return bookList;
	}

	// 도서목록 설정
	public void setBookList(List<BookDto> bookList) {
		this.bookList = bookList;
	}

}
