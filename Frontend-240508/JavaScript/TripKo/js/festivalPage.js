window.onload = function() {
  const sliderWrapper = document.querySelector(".slider-wrapper");
  const sliders = sliderWrapper.querySelectorAll(".slider");

  const sliderCount = sliders.length;
  let currentIndex = 0;
  const sliderInterval = 3000;
  const slideWidth = 1200; // 슬라이드의 너비를 변수로 지정

  // 각 wrapper의 초기 위치 설정
  sliders.forEach((slider, index) => {
    slider.style.left = `${index * slideWidth}px`; // left 속성으로 위치 지정
  });

  setInterval(() => {
    currentIndex = (currentIndex + 1) % sliderCount;

    sliders.forEach((slider, index) => {
      const newPosition = -currentIndex * slideWidth;
      slider.style.transition = "transform 1s ease";
      slider.style.transform = `translateX(${newPosition}px)`;
    });
  }, sliderInterval);
}
