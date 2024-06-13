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
	public void updateBook(int bookIndex, BookDto updatedBook) {

	}

	@Override
	public boolean isValidIndex(int index) {
		return false;
	}

	@Override
	public List<BookDto> searchBook(String searchStr, int searchType) {
		return null;
	}

	@Override
	public List<BookDto> searchBookByName(String searchStr) {
		return null;
	}

	@Override
	public List<BookDto> searchBookByAuthor(String searchStr) {
		return null;
	}

	@Override
	public boolean isIndexExists(int index) {
		return false;
	}

	@Override
	public void saveFile() {

	}

}
