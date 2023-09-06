document.addEventListener('DOMContentLoaded', function() {
  // ここにJavaScriptコードを記述
  function updateDigitalClock() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');

    const timeElement = document.getElementById('time');
    if (timeElement) {
      timeElement.textContent = `${hours}:${minutes}:${seconds}`;
    }
  }

  updateDigitalClock();
  setInterval(updateDigitalClock, 1000);
});