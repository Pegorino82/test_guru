document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('.sort_by_title');
    if (control) {
        control.addEventListener('click', sortByTitle)
    }
})

const sortByTitle = () => {
    const table = document.querySelector('table');
    const tableHead = table.querySelector('thead');
    const tableBody = table.querySelector('tbody');
    const rows = tableBody.querySelectorAll('tr');
    const sortedRows = [];
    for (const row of rows) {
        sortedRows.push(row)
    }
    const arrowUp = tableHead.querySelector('.octicon-arrow-up');
    const arrowDown = tableHead.querySelector('.octicon-arrow-down');
    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc);
        arrowUp.classList.remove('hide');
        arrowDown.classList.add('hide');
    } else {
        sortedRows.sort(compareRowsDesc);
        arrowUp.classList.add('hide');
        arrowDown.classList.remove('hide');
    }
    const sortedTableBody = document.createElement('tbody');
    for (const row of sortedRows) {
        sortedTableBody.appendChild(row)
    }
    tableBody.parentNode.replaceChild(sortedTableBody, tableBody)
}

const compareRowsAsc = (row1, row2) => {
    const title1 = row1.querySelector('td').textContent;
    const title2 = row2.querySelector('td').textContent;
    if (title1 < title2) {
        return -1
    } else if (title1 > title2) {
        return 1
    }
    return 0
}

const compareRowsDesc = (row1, row2) => {
    const title1 = row1.querySelector('td').textContent;
    const title2 = row2.querySelector('td').textContent;
    if (title1 < title2) {
        return 1
    } else if (title1 > title2) {
        return -1
    }
    return 0
}