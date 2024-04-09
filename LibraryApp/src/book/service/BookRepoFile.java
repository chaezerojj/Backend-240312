package book.service;

import java.util.List;

import book.dto.BookDto;

public class BookRepoFile implements BookService {

	@Override
	public List<BookDto> getBookDtos() {
		return null;
	}

	@Override
	public void createBook(BookDto newBook) {

	}

	@Override
	public void deleteBook(int index) {

	}

	@Override
	public boolean isValidIndex(int index) {
		return false;
	}

	@Override
	public void updateBook(int bookIndex, BookDto updatedBook) {

	}


	@Override
	public List<BookDto> searchBook(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}
