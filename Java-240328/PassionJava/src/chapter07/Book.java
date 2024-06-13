package chapter07;
// 도서관리 프로그램
// 책 정보 클래스
public class Book {
	private String name;
	private int price;
	private String publisher;
	
	public void setBook(String n, int p, String pub) {
		name = n;
		price = p;
		publisher = pub;
	}
	
	public void getBook() {
		System.out.println("책이름: " + name);
		System.out.println("가격: " + price + "원");
		System.out.println("출판사: " + publisher);
		System.out.println();
	}
	
	public static void main(String[] args) {
		Book book1 = new Book();
		book1.setBook("자바", 15000, "아이티출판사");
		book1.getBook();
		Book book2 = new Book();
		book2.setBook("파이썬", 17000, "한국출판사");
		book2.getBook();
	}

}
