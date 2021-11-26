document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('.progress');
    if (control) {
        const progressBar = control.querySelector('.progress-bar');
        const total = progressBar.dataset.total;
        const current = progressBar.dataset.current;
        const progress = 100 * current / total
        progressBar.style.width = `${progress}%`;
        progressBar.setAttribute('aria-valuenow', `${progress}`)
    }
})