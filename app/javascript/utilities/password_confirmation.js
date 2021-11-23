document.addEventListener('turbolinks:load', () => {
    const password2 = document.getElementById('user_password_confirmation');
    if (!password2) {
        return
    }
    password2.addEventListener('input', passwordConfirmation)
})

const passwordConfirmation = () => {
    const password1 = document.getElementById('user_password');
    const password2 = document.getElementById('user_password_confirmation');
    if (!password2.value) {
        return;
    }
    if (password1.value !== password2.value) {
        password2.parentNode.querySelector('.octicon-x-circle-fill').classList.remove('hide');
        password2.parentNode.querySelector('.octicon-check-circle-fill').classList.add('hide');
    } else {
        password2.parentNode.querySelector('.octicon-x-circle-fill').classList.add('hide');
        password2.parentNode.querySelector('.octicon-check-circle-fill').classList.remove('hide');
    }
}