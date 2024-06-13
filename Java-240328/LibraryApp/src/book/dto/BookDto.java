package book.dto;

import java.util.Objects;

// 도서 개별 정보 저장 클래스
public class BookDto {
	private int index; // 도서 index
	private String name; // 책이름
	private String author; // 저자
	private String publisher; // 출판사
	private String isRental; // 대여 가능 여부
	private String category; // 카테고리 (분야)

	public BookDto(int index, String name, String author, String publisher, String isRental, String category) {
		this.index = index;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.isRental = isRental;
		this.category = category;
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
	public int hashCode() {
		return Objects.hash(index);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookDto bookDto = (BookDto) obj;
		return index == bookDto.index;
	}

	@Override
	public String toString() {
		return "Book [인덱스=" + index + ", 도서명=" + name + ", 저자=" + author + ", 출판사=" + publisher + ", 대여=" + isRental
				+ ", 카테고리=" + category + "]";
	}

}
