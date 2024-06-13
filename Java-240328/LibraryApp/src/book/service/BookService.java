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

	List<BookDto> searchBookByName(String searchStr); // 도서명으로 검색

	List<BookDto> searchBookByAuthor(String searchStr); // 저자로 검색

	List<BookDto> searchBook(String searchStr, int searchType); // 도서 검색

	boolean isIndexExists(int index); // 존재하는 인덱스인지 확인

	void saveFile(); // 파일 저장

	
	

}
