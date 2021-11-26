document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('table tbody');
    if (control) {
        control.addEventListener('click', (event) => {
            if (event.target.classList.contains('form-inline-link')) {
                event.preventDefault();
                const testId = event.target.dataset.testId;
                formInlineHandler(testId)
            }
        })
    }

    const errors = document.querySelector('.resource-errors');
    if (errors) {
        const resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId)
    }
})

const formInlineHandler = (testId) => {
    const testLink = document.querySelector(`td a[data-test-id="${testId}"]`);
    const formInline = document.querySelector(`td .form-inline[data-test-id="${testId}"]`);
    if (!formInline) return
    if (formInline.classList.contains('hide')) {
        testLink.classList.add('hide');
        formInline.classList.remove('hide');
        event.target.textContent = "<%= t('common.cancel') %>"
        event.target.textContent = event.target.dataset.nameLocaleCancel
    } else {
        testLink.classList.remove('hide');
        formInline.classList.add('hide');
        event.target.textContent = event.target.dataset.nameLocaleEdit
    }
}