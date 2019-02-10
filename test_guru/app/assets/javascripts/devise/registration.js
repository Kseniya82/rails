document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('user_password_confirmation')
  if (control) { control.addEventListener('input', comparePassword) }
})

function comparePassword() {
  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value

  if (password_confirmation.length == 0) {
    return document.querySelector('.octicon-info').classList.add('hide')
  }

  if (password_confirmation != password) {
    document.querySelector('.octicon-info').classList.remove('hide')
    document.querySelector('.octicon-info').classList.add('text-danger')
    document.querySelector('.octicon-info').classList.remove('text-success')
  } else {
    document.querySelector('.octicon-info').classList.remove('hide')
    document.querySelector('.octicon-info').classList.remove('text-danger')
    document.querySelector('.octicon-info').classList.add('text-success')
  }
}
