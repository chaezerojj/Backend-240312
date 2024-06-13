package review.phoneBook;

import java.util.List;

public class PhoneBookApp {

	public static void getPersons(PersonController pc) {
		pc.getPersons();
	}

	public static void main(String[] args) {
		PersonController pc = new PersonController();

		pc.putPerson("김자바1", "010-1111-1111");
		pc.putPerson("김자바2", "010-2222-2222");
		pc.putPerson("김자바3", "010-3333-3333");
//		pc.getPersons();
		getPersons(pc);

		System.out.println("===============================================");

		// phonebook 라이브러리를 배포했을때
		// 배포받은 개발자가 출력을 자기만의 스타일로 만들고 싶을때
		// 출력만 커스터마이징하기
		// 1. 상속
		CustomController cc = new CustomController();
		cc.putPerson("김자바1", "010-1111-1111");
		cc.putPerson("김자바2", "010-2222-2222");
		cc.putPerson("김자바3", "010-3333-3333");
		getPersons(cc);
		// 2. 인터페이스
		PrintPersonImp ppi = new PrintPersonImp();
		pc.printPersons(ppi);

		// 1번과 2번 개발자는 스크립트 개발자 입장에서는 복잡하고 번거로움
		// 3. 익명 클래스
		System.out.println("익명 클래스");
		pc.printPersons(new PrintPerson() {
			@Override
			public void printPersons(List<Person> persons) {
				for (Person person : persons) {
					System.out.println("***********************");
					System.out.println("이름: ");
					System.out.println(person.getName());
					System.out.println("이름: ");
					System.out.println(person.getPhone());
					System.out.println("***********************");
				}
			}
		});
		// 자바 1.8 람다식
		// 4. 람다식
		System.out.println("람다식");
		pc.printPersons(persons -> {
			for (Person person : persons) {
				System.out.println("-------------");
				System.out.print("이름: ");
				System.out.print(person.getName());
				System.out.println();
				System.out.print("전화번호:");
				System.out.print(person.getPhone());
				System.out.println();
				System.out.println("-------------");
			}
		});
	}

}