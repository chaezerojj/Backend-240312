package chapter25;

public class EnumClass {
	static final int DOG = 1;
	static final int CAT = 2;
	static final int MAN = 1;
	static final int WOMAN = 2;
	
	public static void who(int man) {
		switch(man) {
		case EnumClass.MAN:
			System.out.println("남성 손님입니다.");
			break;
		case EnumClass.WOMAN:
			System.out.println("여성 손님입니다.");
			break;
		}
	}
	
	public static void main(String[] args) {
		who(EnumClass.MAN);
		who(EnumClass.CAT);
		
		
	}
	
}




