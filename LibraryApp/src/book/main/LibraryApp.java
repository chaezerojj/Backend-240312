package book.main;

import book.controller.BookController;
import book.dto.BookDto;
import book.service.BookRepository;

public class LibraryApp {

	public static void main(String[] args) {
//		BookRepository bookRepository = new BookRepository();
		
		BookController bController = new BookController(new BookRepository());
		
		BookDto[] books = {
				new BookDto(1, "모순", "양귀자", "쓰다", "가능", "한국소설"),
				new BookDto(2, "이처럼 사소한 것들", "클레어 키건", "다산책방", "가능", "외국소설"),
				new BookDto(3, "데미안", "헤르만 헤세", "민음사", "불가", "외국소설"),
				new BookDto(4, "홍학의 자리", "정해연", "엘릭시스", "가능", "한국소설"),
				new BookDto(5, "아주 희미한 빛으로", "최은영", "문학동네", "불가", "한국소설"),
				new BookDto(6, "도둑맞은 집중력", "요한 하리", "어크로스", "불가", "인문"),
				new BookDto(7, "도파민네이션", "애나 렘키", "흐름출판", "가능", "인문"),
				new BookDto(8, "생각중독", "닉 드렌턴", "갤리온", "가능", "인문"),
				new BookDto(9, "귀신들의 땅", "천쓰홍", "민음사", "불가", "외국소설"),
				new BookDto(10, "이방인", "알베르 카뮈", "민음사", "불가", "외국소설"),
				new BookDto(11, "종의 기원", "정유정", "은행나무", "가능", "한국소설"),
				new BookDto(12, "불안", "알랭 드 보통", "은행나무", "가능", "에세이"),
				new BookDto(13, "불변의 법칙", "모건 하우절", "서삼독", "불가", "정치사회"),
				new BookDto(14, "돈의 속성", "김승호", "스노우폭스북스", "불가", "정치사회"),
				new BookDto(15, "물고기는 존재하지 않는다", "룰루 밀러", "곰출판", "가능", "과학"),
				new BookDto(16, "이기적 유전자", "리처드 도킨스", "을유문화사", "불가", "과학"),
				new BookDto(17, "코스모스", "칼 세이건", "사이언스북스", "가능", "과학"),
				new BookDto(18, "다정한 것이 살아남는다", "브라이언 헤어 외", "디플롯", "불가", "과학"),
				new BookDto(19, "센세이셔널", "애슐리 워드", "상상스퀘어", "가능", "과학"),
				new BookDto(20, "지구 끝의 온실", "김초엽", "자이언트북스", "가능", "한국소설"),
				new BookDto(21, "트러스트", "에르난 다이스", "문학동네", "불가", "외국소설"),
				new BookDto(22, "시장학개론", "김승호", "스노우폭스북스", "가능", "경제"),
				new BookDto(23, "메리골드 마음 사진관", "윤정은", "북로망스", "가능", "한국소설"),
				new BookDto(24, "1984", "조지 오웰", "민음사", "가능", "외국소설"),
				new BookDto(25, "달과 6펜스", "서머싯 몸", "민음사", "불가", "외국소설"),
				new BookDto(26, "젊은 베르테르의 슬픔", "요햔 볼프강 폰 괴테", "민음사", "불가", "외국소설"),
				new BookDto(27, "광인", "이혁진", "민음사", "가능", "한국소설"),
				new BookDto(28, "22세기 민주주의", "나리타 유스케", "틔움출판", "가능", "정치사회"),
				new BookDto(29, "세상을 만드는 글자, 코딩", "박준석", "동아시아", "불가", "과학"),
				new BookDto(30, "퍼펙트 게스", "이인아", "21세기 북스", "가능", "과학")
		};
		
//		new BookDto(0, "도서명", "저자", "출판사", "대출여부", "카테고리");


		bController.runApp();
//		bController.getBookList();
		
		
		
	}

}
