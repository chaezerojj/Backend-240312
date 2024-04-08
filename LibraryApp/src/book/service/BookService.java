package book.service;

import java.util.List;

import book.dto.BookDto;

public interface BookService {

	// 도서 정보 저정 배열을 가져오는 메소드
	List<BookDto> getBookDtos();

	void createBook(BookDto newBook); // 도서 등록

	void updateBook(int bookIndex, BookDto updatedBook); // 도서 정보 수정

	void deleteBook(int index); // 도서 삭제

	boolean isValidIndex(int index); // deleteBook - 유효한 인덱스인지 확인

	void addBook(BookDto newBook);

}
