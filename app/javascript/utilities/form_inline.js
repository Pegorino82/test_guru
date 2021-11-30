document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('table tbody');
    if (control) {
        control.addEventListener('click', (event) => {
            if (event.target.classList.contains('form-inline-link')) {
                event.preventDefault();
                const testId = event.target.dataset.editInlineTestId;
                formInlineHandler(testId)
            }
        })
    }

    const errors = document.querySelector('.resource-errors');
    if (errors) {
        const resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId, true)
    }
})

const formInlineHandler = (testId, error=false) => {
    const formInline = document.querySelector(`td .form-inline[data-test-id="${testId}"]`);
    if (!formInline) return
    const testLink = document.querySelector(`td a[data-test-id="${testId}"]`);
    const editLink = document.querySelector(`[data-edit-inline-test-id="${testId}"]`);
    if (error) {
        editLink.classList.add('hide')
    }
    if (formInline.classList.contains('hide')) {
        testLink.classList.add('hide');
        formInline.classList.remove('hide');
        editLink.textContent = editLink.dataset.nameLocaleCancel
    } else {
        testLink.classList.remove('hide');
        formInline.classList.add('hide');
        editLink.textContent = editLink.dataset.nameLocaleEdit
    }
}