package book.main;

import book.controller.BookController;
import book.service.BookRepository;
import book.view.BookView;

public class LibraryApp {

	public static void main(String[] args) {
		BookRepository bookRepository = new BookRepository();
		BookView bookView = new BookView();
		BookController bController = new BookController(bookRepository, bookView);

		bController.runApp();
		
	}

}
