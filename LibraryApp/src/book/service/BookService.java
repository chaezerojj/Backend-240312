package book.service;

import java.util.List;

import book.dto.BookDto;

public interface BookService {

	// 도서 정보 저정 배열을 가져오는 메소드
	List<BookDto> getBookDtos();

	void createBook(BookDto newBook); // 기존 목록에서 도서 추가

	void updateBook(int bookIndex, BookDto updatedBook); // 도서 정보 수정

	void deleteBook(int index); // 도서 삭제

	boolean isValidIndex(int index); // deleteBook - 유효한 인덱스인지 확인

	List<BookDto> searchBookByName(String searchStr); 

	public List<BookDto> searchBookByAuthor(String searchStr);

	List<BookDto> searchBookByPublisher(String searchStr);

	List<BookDto> searchBookByCategory(String searchStr);

	List<BookDto> searchBook(String searchStr, int searchType);

	boolean isIndexExists(int index);

	void saveFile();

	
	

}
