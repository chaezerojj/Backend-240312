package chapter27;

public class Friend {
	private String name;
	private Company cmp;
	
	public Friend(String n, Company c) {
		name = n;
		cmp = c;
	}
	
	public String getName() {
		return name;
	}
	
	public Company getCmp() {
		return cmp;
	}
	
}
