package chapter12;

// 다형성 (polymorphism)

public class Tv02 {
	private boolean power;
	
	public void power() {
		power =! power;
	}

	public boolean isPower() {
		return power;
	}

	public void setPower(boolean power) {
		this.power = power;
	}
	
	
	
}
