window.onload = function() {
  const sliderWrapper = document.querySelector(".slider-wrapper");
  const sliders = sliderWrapper.querySelectorAll(".slider");

  const sliderCount = sliders.length;
  let currentIndex = 0;
  let sliderInterval = 3000;
  const slideWidth = 1200; // 슬라이드의 너비를 변수로 지정

  // 각 wrapper의 초기 위치 설정
  sliders.forEach((slider, index) => {
    slider.style.transform = `translateX(${index * slideWidth}px)`; // 수평으로 배열되어 있다고 가정하여 슬라이드의 너비만큼 간격으로 위치 지정
  });

  setInterval(() => {
    currentIndex = (currentIndex + 1) % sliderCount;

    sliders.forEach((slider, index) => {
      // 수정: 현재 인덱스에 따라 올바른 위치로 이동하도록 수정
      const newPosition = (index - currentIndex) * slideWidth;
      slider.style.transition = "transform 1s ease";
      slider.style.transform = `translateX(${newPosition}px)`;
    });
  }, sliderInterval);
}
