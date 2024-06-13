package review.phoneBook;

import java.util.List;

public class PrintPersonImp implements PrintPerson{

	@Override
	public void printPersons(List<Person> persons) {
		for (Person person: persons) {
			System.out.println("***********************");
			System.out.println("이름: ");
			System.out.println(person.getName());
			System.out.println("이름: ");
			System.out.println(person.getPhone());
			System.out.println("***********************");
			
		}
	}
	
}
