package service;

import java.util.ArrayList;
import java.util.List;

import dto.FortuneDto;

public class FortuneRepository implements FortuneService{

	private List<FortuneDto> fortuneDtos = new ArrayList<>();
	
	@Override
	public List<FortuneDto> getFortuneDtos() {
		return fortuneDtos;
	}

	@Override
	public void createFortune(String fortuneStr) {
		
	}

}
