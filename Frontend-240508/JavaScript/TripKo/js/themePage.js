window.onload = function() {
  const sliderWrapper = document.querySelector('.slider-wrapper');
  const sliderInner = sliderWrapper.querySelector('.slider-inner');
  const sliders = sliderInner.querySelectorAll('.slider');

  const slideCount = sliders.length;
  const slideWidth = sliders[0].offsetWidth;
  const totalWidth = slideWidth * slideCount;
  const sliderInterval = 3000;

  // 슬라이드 영역 설정
  sliderInner.style.width = `${totalWidth}px`;

  let currentIndex = 0; // 현재 보이는 슬라이드의 인덱스

  // 각 wrapper의 초기 위치 설정
  sliders.forEach((slider, index) => {
    slider.style.left = `${index * slideWidth}px`; // left 속성으로 위치 지정
  });

  setInterval(() => {
    currentIndex = (currentIndex + 1) % slideCount;

    sliders.forEach((slider, index) => {
      const newPosition = -currentIndex * slideWidth;
      slider.style.transition = "transform 1s ease";
      slider.style.transform = `translateX(${newPosition}px)`;
    });
  }, sliderInterval);
}


// ----------------------------------------------------------

// contents
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