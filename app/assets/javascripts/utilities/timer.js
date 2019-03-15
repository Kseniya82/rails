document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.time-left');

  if (timer) {
    var timerSecondsLeft = parseInt(timer.dataset.timeLeft);

    setInterval(function() {
      if (timerSecondsLeft == 0) { submitTestPassageForm() }

      var seconds = timerSecondsLeft % 60;
      var minutes = (timerSecondsLeft - seconds) / 60;

      timer.textContent = 'Time left ' + minutes + ':' + (seconds < 10 ? '0' + seconds : seconds);

      timerSecondsLeft--;
    }, 1000);
  }
})

function submitTestPassageForm() {
  var form = document.querySelector('.show-test-passage-form');

  if (form) { form.submit() }
}
