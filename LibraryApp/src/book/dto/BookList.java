package book.dto;

import java.util.ArrayList;
import java.util.List;

// 도서 목록 저장 클래스(BookList)
public class BookList {
	private List<BookDto> bookList;
	
	public BookList() {
		this.bookList = new ArrayList<>();
	}
	
	public BookList(List<BookDto> bookList) {
		this.bookList = bookList;
	}

	public List<BookDto> getBookList() {
		return bookList;
	}

	public void setBookList(List<BookDto> bookList) {
		this.bookList = bookList;
	}


}
