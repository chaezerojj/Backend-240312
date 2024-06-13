document.addEventListener("DOMContentLoaded", function() {
  const cityBox = document.querySelector(".random-city");
  const themeBox = document.querySelector(".random-theme");
  const randomButton = document.querySelector(".random-button");
  const cityText = document.querySelector(".city-text");
  const themeText = document.querySelector(".theme-text");

  // 랜덤 도시 리스트
  const cityList = [
    "서울", "경기", "강원", "충청", "전남", "전북", "경남", "경북", "제주", "인천", "대구", "대전", "부산", "제주"
  ];

  // 랜덤 테마 리스트
  const themeList = [
    "힐링", "액티비티", "맛집탐방", "휴양지", "이색체험", "나들이", "전통시장투어", "관광지투어", "바다", "숲", "역사", "드라이브"
  ];

  // 이미 표시된 도시와 테마를 담는 세트 리스트
  const displayedCities = new Set();
  const displayedThemes = new Set();

  // 랜덤으로 도시와 테마 선택하는 함수
  function randomPick() {
    // 모든 도시와 테마가 표시된 경우 알림
    if (displayedCities.size === cityList.length && displayedThemes.size === themeList.length) {
      alert("모든 도시와 테마에 대해 랜덤 표시가 완료되었습니다!");
      return;
    }

    let city;
    let theme;

    // 중복되지 않는 도시를 선택할 때까지 반복
    do {
      city = cityList[Math.floor(Math.random() * cityList.length)];
    } while (displayedCities.has(city));
    displayedCities.add(city);

    // 중복되지 않는 테마를 선택할 때까지 반복
    do {
      theme = themeList[Math.floor(Math.random() * themeList.length)];
    } while (displayedThemes.has(theme));
    displayedThemes.add(theme);

    // 도시와 테마를 각각 표시
    cityBox.textContent = city;
    themeBox.textContent = theme;

    // 애니메이션 효과 추가
    cityBox.classList.add('fade-in');
    themeBox.classList.add('fade-in');

    // 애니메이션 종료 후 클래스 제거
    setTimeout(() => {
      cityBox.classList.remove('fade-in');
      themeBox.classList.remove('fade-in');
    }, 300);
  }

  randomButton.addEventListener("click", randomPick);

  randomButton.addEventListener("click", function() {
    cityText.style.display = "block";
    themeText.style.display = "block";
  })
});
