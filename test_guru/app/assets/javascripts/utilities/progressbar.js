document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');
  if (progressBar) {
    setValueProgressBar(progressBar);
  }
})

function setValueProgressBar(progressBar) {
  var currentNumber = progressBar.dataset.currentNumber;
  var count = progressBar.dataset.count;

  var percent = (currentNumber - 1 ) / count * 100;

  progressBar.style.width = percent +'%';
}
