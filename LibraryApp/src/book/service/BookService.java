package book.service;

import java.util.List;
import java.util.Scanner;

import book.dto.BookDto;

public interface BookService {

	List<BookDto> getBookDtos();

	void createBook(BookDto newBook); // 도서 등록

	void deleteBook(int index); // 도서 삭제

	boolean isValidIndex(int index); // deleteBook - 유효한 인덱스인지 확인

	void updateBook(int bookIndex, BookDto updatedBook); // 도서 정보 수정

	void addBook(BookDto newBook);

}
