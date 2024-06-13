package chapter19;

public class Card {
	
	private String kind;
	private int number;
	
	public Card() {
		this("SPADE",1);
	}
	
	public Card(String kind, int number) {
		this.kind = kind;
		this.number = number;
	}

}