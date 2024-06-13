document.addEventListener("DOMContentLoaded", function() {
  // 문서 객체 가져오기
  const nicknameBox = document.getElementById("nickname-box");
  const nButton = document.getElementById("nickname-button");

  // 닉네임 리스트
  const nicknameList = [
    "카드값줘체리", "이쑤신장군", "비긴이계인",
    "추적60인분", "명란젓코난",
    "소리없는정우성", "닥터 전자레인지", "모르는개산책", 
    "아무리생강캐도난마늘","안졸리냐졸려", 
    "번둥천개", "올리비아핫바", "시베리안허숙희", 
    "레오나르도빚갚으리오", "짱구는옷말려",
    "그리움만사인회", "피자헛둘셋넷", "남남수수학학원원장",
    "넌정말극악무도회", "가문의영광굴비"
  ];

  // 이미 표시된 닉네임을 담는 세트 리스트
  const displayedNicknames = new Set();

  // 랜덤으로 닉네임 선택하는 함수
  function randomNickname() {
    // 닉네임이 20개가 있으므로, 모든 닉네임이 다 나왔을 때
    // alert창으로 알려줌
    if (displayedNicknames.size === nicknameList.length) {
      alert("모든 닉네임이 표시되었습니다!");
      return;
    }
    
    // 닉네임 변수 지정
    let nickname;
    // 중복되지 않는 닉네임을 선택할 때까지 랜덤 반복
    do {
      nickname = nicknameList[Math.floor(Math.random() * nicknameList.length)];
    } while (displayedNicknames.has(nickname));
    
    // 랜덤으로 뽑힌 닉네임을 세트에 추가 
    // (이미 사용한 닉네임이므로 더이상 중복된 값이 나오는 것을 방지)
    displayedNicknames.add(nickname);

    // 닉네임을 표시할 div 요소 생성
    const result = document.createElement("div");
    result.textContent = nickname;
    
    // 애니메이션 효과 (닉네임이 살짝 기다렸다가 등장 - css)
    nicknameBox.innerHTML = '';
    nicknameBox.appendChild(result);
    result.classList.add('fade-in'); // css 애니메이션 효과 추가
  }

  // 버튼 클릭 이벤트 리스너 추가
  nButton.addEventListener("click", randomNickname);
});
