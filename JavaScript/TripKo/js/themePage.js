window.onload = function() {
  const sliderWrapper = document.querySelector('.slider-wrapper');
  const sliderInner = sliderWrapper.querySelector('.slider-inner');
  const slider = sliderInner.querySelectorAll('.slider');
  const moveButton = sliderWrapper.querySelector('.arrow');

  // sliderInner 넓이 계산
  const innerWidth = sliderWrapper.clientWidth;
  const sliderWidth = innerWidth * slider.length;
  sliderInner.style.width = `${sliderWidth}px`;

  // 리스너
  let currentIndex = 0;
  let translate = 0;
  
  const moveSlide = (event) => {
    event.preventDefault();
    if (event.target.className === 'next') {
      if (currentIndex !== slider.length - 1) {
        translate -= innerWidth;
        sliderInner.style.transform = `translateX(${translate}px)`;
        currentIndex += 1;
      }
    } else if (event.target.className === 'prev') {
      if (currentIndex !== 0) {
        translate += innerWidth;
        sliderInner.style.transform = `translateX(${translate}px)`;
        currentIndex -= 1;
      }
    }
  }
  
  moveButton.addEventListener('click', moveSlide);
}