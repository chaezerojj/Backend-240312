package book.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import book.controller.BookController;
import book.dto.BookDto;
import book.dto.BookDto2;

public class BookRepository implements BookService {
	private List<BookDto> bookDtos = new ArrayList<>();

	@Override
	public List<BookDto> getBookDtos() {
		return bookDtos;
	}

	@Override
	public void createBook(BookDto newBook) {
		BookDto bDto = new BookDto();
		bookDtos.add(newBook);
	}

	@Override
	public void deleteBook(int index) {
		BookDto bDto = new BookDto();
		bookDtos.remove(index);
	}

	@Override
	public boolean isValidIndex(int index) {
		return index >= 0 && index < bookDtos.size();
	}

	@Override
	public void updateBook(int bookIndex, BookDto updatedBook) {
		if (isValidIndex(bookIndex)) {
			bookDtos.set(bookIndex, updatedBook);
		} else {
			System.out.println("유효하지 않은 인덱스입니다.");
		}
	}

	
	// 기존 리스트 책 추가 메소드
	@Override
	public void addBook(BookDto newBook) {
		bookDtos.add(newBook);
	}

}
