package chapter27;

import java.util.Optional;

public class ShowCompWithOp {
	// Optional 사용하여 showCompAddr 메소드 개선
	
	public static void showCompAddr(Optional<Friend> f) {
		String addr = f.map(fr -> fr.getCmp())
					.map(c -> c.getcInfo())
					.map(ci -> ci.getAdrs())
					.orElse("There is no information.");
				
		System.out.println(addr);
	}
	
	public static void main(String[] args) {
		showCompAddr(Optional.of(new Friend(null, null)));
	}
}
