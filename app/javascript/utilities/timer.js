document.addEventListener('turbolinks:load', () => {
    const timer = document.getElementById('timer');
    if (timer) {
        timer.innerText = intToTimeString(timer.dataset.total)
        startTimer()
    }
})

const startTimer = () => {
    setTimeout(() => {
        const timer = document.getElementById('timer');
        if (!timer) {
            return
        }
        let leftTime = timeStringToInt(timer.innerText)
        if ( leftTime <= 0) {
            return document.querySelector('input[type="submit"]').click()
        }
        leftTime -= 1
        timer.innerText = intToTimeString(leftTime)
        startTimer(leftTime)
    }, 1000)
}

const intToTimeString = (value) => {
    const twoDigits = (digit) => {
        return digit / 10 >= 1 ? digit : '0' + digit
    }
    if (value < 60) {
        return `00:${twoDigits(value)}`
    }
    const minutes = Math.floor(value / 60);
    const seconds = value - minutes * 60;
    return `${twoDigits(minutes)}:${twoDigits(seconds)}`
}

const timeStringToInt = (value) => {
    const time = value.split(':');
    return time[0] * 60 + parseInt(time[1])
}