package book.dto;

// 도서 정보 저장 클래스
public class BookDto {
	private int index; // 도서 index
	String name; // 책이름 
	String author; // 저자
	String publisher; // 출판사
	String isRental; // 대여 가능 여부
	String category; // 카테고리 (분야)
		
	public BookDto(int index, String name, String author, String publisher, String isRental, String category) {
		this.index = index;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.isRental = isRental;
		this.category = category;
	}

	// 생성자 초기화!!
	public BookDto() {

	}

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String isRental() {
		return isRental;
	}
	public void setRental(String isRental) {
		this.isRental = isRental;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "Book [index=" + index + ", name=" + name + ", author=" + author + ", publisher=" + publisher
				+ ", isRental=" + isRental + ", category=" + category + "]";
	}
	
	
}
