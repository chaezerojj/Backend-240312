package service;

import java.util.List;
import dto.FortuneDto;

public interface FortuneService {

	// 운세들이 저장된 배열을 가져오는 메소드
	List<FortuneDto> getFortuneDtos();

	// Create(생성) - 운세를 생성하는 메소드
	void createFortune(String fortuneStr);

	// Delete(삭제)
	void deleteFortune(int index);

	// Update(수정)
	void updateFortune(int index, String fortuneStr);

}
