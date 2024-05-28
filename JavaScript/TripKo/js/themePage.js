// themePage.js

// 자동 슬라이더 - 3초에 한번씩 메인 이미지 자동으로 넘어감

window.onload = function() {
  const sliderWrapper = document.querySelector('.slider-wrapper');
  const sliderInner = sliderWrapper.querySelector('.slider-inner');
  const slider = sliderInner.querySelectorAll('.slider');

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
}
