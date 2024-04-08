package book.dto;

import java.util.List;

public class BookDto2 {
	private List<BookDto> bookList;

	public BookDto2(List<BookDto> bookList) {
		this.bookList = bookList;
	}

	public List<BookDto> getBookList() {
		return bookList;
	}

	public void setBookList(List<BookDto> bookList) {
		this.bookList = bookList;
	}

}
