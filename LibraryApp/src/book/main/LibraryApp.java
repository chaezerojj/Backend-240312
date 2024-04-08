package book.main;

import book.controller.BookController;
import book.dto.BookDto;
import book.service.BookRepository;

public class LibraryApp {

	public static void main(String[] args) {
		BookController bController = new BookController(new BookRepository());
		
		// 민음사 세계문학전집
		// https://namu.wiki/w/%EC%84%B8%EA%B3%84%EB%AC%B8%ED%95%99%EC%A0%84%EC%A7%91(%EB%AF%BC%EC%9D%8C%EC%82%AC)
		
		BookDto newBook = new BookDto(1, "제목", "저자", "출판사", "대여여부", "카테고리");
		BookDto newBook1 = new BookDto(2, "제목2", "저자2", "출판사2", "대여여부2", "카테고리2");
		BookDto newBook2 = new BookDto(3, "제목3", "저자3", "출판사3", "대여여부3", "카테고리3");
		BookDto newBook3 = new BookDto(4, "제목4", "저자4", "출판사4", "대여여부4", "카테고리4");
		BookDto newBook4 = new BookDto(5, "제목5", "저자5", "출판사5", "대여여부5", "카테고리5");
		
		
	}

}
