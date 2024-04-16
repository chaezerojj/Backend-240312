package book.service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import book.dto.BookDto;

public class BookRepository implements BookService {
	private List<BookDto> bookDtos;

	public BookRepository() {
		this.bookDtos = new ArrayList<>();
		bookData();
	}

	// 초기 도서 목록
	public void bookData() {
//		bookDtos.add(new BookDto(0, "도서명", "저자", "출판사", "대여여부", "카테고리"));
		bookDtos.add(new BookDto(1, "모순", "양귀자", "쓰다", "가능", "한국소설"));
		bookDtos.add(new BookDto(2, "이처럼 사소한 것들", "클레어 키건", "다산책방", "가능", "외국소설"));
		bookDtos.add(new BookDto(3, "데미안", "헤르만 헤세", "민음사", "불가", "외국소설"));
		bookDtos.add(new BookDto(4, "홍학의 자리", "정해연", "엘릭시스", "가능", "한국소설"));
		bookDtos.add(new BookDto(5, "아주 희미한 빛으로", "최은영", "문학동네", "불가", "한국소설"));
		bookDtos.add(new BookDto(6, "도둑맞은 집중력", "요한 하리", "어크로스", "불가", "인문"));
		bookDtos.add(new BookDto(7, "도파민네이션", "애나 렘키", "흐름출판", "가능", "인문"));
		bookDtos.add(new BookDto(8, "생각중독", "닉 드렌턴", "갤리온", "가능", "인문"));
		bookDtos.add(new BookDto(9, "귀신들의 땅", "천쓰홍", "민음사", "불가", "외국소설"));
		bookDtos.add(new BookDto(10, "혼자 공부하는 자바", "신용권", "한빛미디어", "불가", "컴퓨터/IT"));
		bookDtos.add(new BookDto(11, "종의 기원", "정유정", "은행나무", "가능", "한국소설"));
		bookDtos.add(new BookDto(12, "개밥바라기별", "황석영", "문학동네", "가능", "한국소설"));
		bookDtos.add(new BookDto(13, "불변의 법칙", "모건 하우절", "서삼독", "불가", "정치사회"));
		bookDtos.add(new BookDto(14, "돈의 속성", "김승호", "스노우폭스북스", "불가", "정치사회"));
		bookDtos.add(new BookDto(15, "물고기는 존재하지 않는다", "룰루 밀러", "곰출판", "가능", "과학"));
		bookDtos.add(new BookDto(16, "이기적 유전자", "리처드 도킨스", "을유문화사", "불가", "과학"));
		bookDtos.add(new BookDto(17, "코스모스", "칼 세이건", "사이언스북스", "가능", "과학"));
		bookDtos.add(new BookDto(18, "다정한 것이 살아남는다", "브라이언 헤어 외", "디플롯", "불가", "과학"));
		bookDtos.add(new BookDto(19, "센세이셔널", "애슐리 워드", "상상스퀘어", "가능", "과학"));
		bookDtos.add(new BookDto(20, "지구 끝의 온실", "김초엽", "자이언트북스", "가능", "한국소설"));
		bookDtos.add(new BookDto(21, "트러스트", "에르난 다이스", "문학동네", "불가", "외국소설"));
		bookDtos.add(new BookDto(22, "시장학개론", "김승호", "스노우폭스북스", "가능", "경제"));
		bookDtos.add(new BookDto(23, "메리골드 마음 사진관", "윤정은", "북로망스", "가능", "한국소설"));
		bookDtos.add(new BookDto(24, "1984", "조지 오웰", "민음사", "가능", "외국소설"));
		bookDtos.add(new BookDto(25, "Do it! 점프 투 파이썬", "박응용", "이지스퍼블리싱", "불가", "컴퓨터/IT"));
		bookDtos.add(new BookDto(26, "젊은 베르테르의 슬픔", "요햔 볼프강 폰 괴테", "민음사", "불가", "외국소설"));
		bookDtos.add(new BookDto(27, "광인", "이혁진", "민음사", "가능", "한국소설"));
		bookDtos.add(new BookDto(28, "22세기 민주주의", "나리타 유스케", "틔움출판", "가능", "정치사회"));
		bookDtos.add(new BookDto(29, "세상을 만드는 글자, 코딩", "박준석", "동아시아", "불가", "과학"));
		bookDtos.add(new BookDto(30, "퍼펙트 게스", "이인아", "21세기 북스", "가능", "과학"));
	}

	// 현재 도서 목록 반환
	@Override
	public List<BookDto> getBookDtos() {
		// 도서 목록을 2차원 배열로 변환하여 반환함
		List<BookDto> bookList = new ArrayList<>();
		for (BookDto book : bookDtos) {
			bookList.add(book);
		}
		return bookList;
	}

	// 도서 등록
	@Override
	public void createBook(BookDto newBook) {
		bookDtos.add(newBook);
	}

	// 도서 삭제
	@Override
	public void deleteBook(int index) {
		bookDtos.remove(index);
	}

	// 유효한 인덱스 확인
	@Override
	public boolean isValidIndex(int index) {
		return index >= 0 && index < bookDtos.size();
	}

	// 도서 수정
	@Override
	public void updateBook(int bookIndex, BookDto updatedBook) {
		if (isValidIndex(bookIndex)) {
			bookDtos.set(bookIndex, updatedBook);
		} else {
			System.out.println("유효하지 않은 인덱스입니다.");
		}
	}

	// 도서 검색
	@Override
	public List<BookDto> searchBook(String searchStr, int searchType) {
		List<BookDto> searchResult = new ArrayList<>();
		switch (searchType) {
		case 1:
			for (BookDto book : bookDtos) {
				if (book.getName().equalsIgnoreCase(searchStr)) {
					searchResult.add(book);
				}
			}
			break;
		case 2:
			for (BookDto book : bookDtos) {
				if (book.getAuthor().equalsIgnoreCase(searchStr)) {
					searchResult.add(book);
				}
			}
			break;
		default:
			break;
		}
		return searchResult;
	}

	// 도서 검색 세부
	// : 도서명, 저자, 출판사, 카테고리 검색
	@Override
	public List<BookDto> searchBookByName(String searchStr) {
		List<BookDto> searchResult = new ArrayList<>();
		for (BookDto book : bookDtos) {
			if (book.getName().equalsIgnoreCase(searchStr)) {
				searchResult.add(book);
			}
		}
		return searchResult;
	}

	@Override
	public List<BookDto> searchBookByAuthor(String searchStr) {
		List<BookDto> searchResult = new ArrayList<>();
		for (BookDto book : bookDtos) {
			if (book.getAuthor().equalsIgnoreCase(searchStr)) {
				searchResult.add(book);
			}
		}
		return searchResult;

	}

	@Override
	public boolean isIndexExists(int index) {
		for (BookDto book : bookDtos) {
			if (book.getIndex() == index) {
				return true; // 이미 존재하는 인덱스 번호
			}
		}
		return false; // 존재하지 않는 인덱스 번호
	}

	// 작성된 도서 정보 목록 파일로 저장(txt)
	@Override
	public void saveFile() {
		try (BufferedWriter writer = new BufferedWriter
				(new FileWriter("BookList.txt"))) 
		{
			Date date = new Date();
			SimpleDateFormat sdf = 
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			writer.write("저장된 날짜: " + sdf.format(date) + "\n");
			writer.write("☆★ 도서 목록 ☆★" + "\n");
			for (BookDto book : bookDtos) {
				writer.write("Book [인덱스=" + book.getIndex() + 
						", 도서명=" + book.getName() + ", 저자=" 
						+ book.getAuthor() + ", 출판사=" + book.getPublisher() 
						+ ", 대여=" + book.isRental() + 
						", 카테고리=" + book.getCategory()
						+ "]" + "\n");
			}
			System.out.println("도서 정보가 파일에 저장되었습니다.");
		} catch (Exception e) {
			System.out.println("오류로 인해 저장에 실패하였습니다." + e.getMessage());
		}
	}

}
