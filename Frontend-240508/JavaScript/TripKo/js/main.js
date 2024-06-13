let currentIndex = 0;
const images = document.querySelectorAll('.main-img');
const totalImages = images.length;

function showImage(index) {
  images.forEach((img, i) => {
    img.style.opacity = '0';
    img.classList.remove('active');
  });
  images[index].style.opacity = '1';
  images[index].classList.add('active');
}

function nextImage() {
  currentIndex = (currentIndex + 1) % totalImages;
  showImage(currentIndex);
}

function startSlideshow() {
  showImage(currentIndex);
  setInterval(nextImage, 3000);
}

document.addEventListener('DOMContentLoaded', startSlideshow);
