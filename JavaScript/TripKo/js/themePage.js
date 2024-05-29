window.onload = function() {
  const sliderWrapper = document.querySelector('.slider-wrapper');
  const sliderInner = sliderWrapper.querySelector('.slider-inner');
  const slider = sliderInner.querySelectorAll('.slider');
  const prevButton = sliderWrapper.querySelector('.prev');
  const nextButton = sliderWrapper.querySelector('.next');

  // 슬라이드 너비와 개수 계산
  const slideWidth = slider[0].offsetWidth;
  const slideCount = slider.length;
  const totalWidth = slideWidth * slideCount;

  // 슬라이드 영역 설정
  sliderInner.style.width = `${totalWidth}px`;

  let currentIndex = 0; // 현재 보이는 슬라이드의 인덱스
  let translate = 0; // 슬라이드 이동 거리
  let timer; // 타이머 변수

  // 자동 재생 시작 함수
  function startAutoPlay() {
    timer = setInterval(() => {
      moveSlide('next');
    }, 3000); // 3초마다 슬라이드 이동
  }

  // 슬라이드 이동 함수
  function moveSlide(direction) {
    // 다음 슬라이드로 이동
    if (direction === 'next') {
      currentIndex++;
      translate -= slideWidth;
      if (currentIndex === slideCount) {
        currentIndex = 0;
        translate = 0;
      }
    }
    // 이전 슬라이드로 이동
    else if (direction === 'prev') {
      currentIndex--;
      translate += slideWidth;
      if (currentIndex < 0) {
        currentIndex = slideCount - 1;
        translate = -(slideWidth * (slideCount - 1));
      }
    }
    // 슬라이드 이동
    sliderInner.style.transform = `translateX(${translate}px)`;
  }

  // 페이지 로드 시 자동 재생 시작
  startAutoPlay();

  // 이전 버튼 클릭 시 이벤트 핸들러
  prevButton.addEventListener('click', () => {
    moveSlide('prev');
  });

  // 다음 버튼 클릭 시 이벤트 핸들러
  nextButton.addEventListener('click', () => {
    moveSlide('next');
  });
}

// 콘텐츠 이름 클릭 시 하위 콘텐츠 보여줌
// 클릭한 버튼에 해당하는 div만 보여주고, 나머지는 보이지 않음
const forestBtn = document.querySelector("#forest-btn");
const beachBtn = document.querySelector("#beach-btn");
const mountainBtn = document.querySelector("#mountain-btn");
const historyBtn = document.querySelector("#history-btn");
const activityBtn = document.querySelector("#activity-btn");

const forestDiv = document.querySelector(".forest");
const beachDiv = document.querySelector(".beach");
const mountainDiv = document.querySelector(".mountain");
const historyDiv = document.querySelector(".history");
const activityDiv = document.querySelector(".activity");

forestBtn.addEventListener("click", function() {
  forestDiv.style.display = "block";
  beachDiv.style.display = "none";
  mountainDiv.style.display = "none";
  historyDiv.style.display = "none";
  activityDiv.style.display = "none";
})

beachBtn.addEventListener("click", function() {
  beachDiv.style.display = "block";
  forestDiv.style.display = "none";
  mountainDiv.style.display = "none";
  historyDiv.style.display = "none";
  activityDiv.style.display = "none";
})

mountainBtn.addEventListener("click", function() {
  mountainDiv.style.display = "block";
  forestDiv.style.display = "none";
  beachDiv.style.display = "none";
  historyDiv.style.display = "none";
  activityDiv.style.display = "none";
})

historyBtn.addEventListener("click", function() {
  historyDiv.style.display = "block";
  forestDiv.style.display = "none";
  beachDiv.style.display = "none";
  mountainDiv.style.display = "none";
  activityDiv.style.display = "none";
})

activityBtn.addEventListener("click", function() {
  activityDiv.style.display = "block";
  forestDiv.style.display = "none";
  beachDiv.style.display = "none";
  mountainDiv.style.display = "none";
  historyDiv.style.display = "none";
})