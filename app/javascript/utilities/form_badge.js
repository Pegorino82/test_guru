document.addEventListener('turbolinks:load', () => {
    const badgeTable = document.getElementById('badge-table');
    if (badgeTable) {
        badgeTable.addEventListener('input', (event) => {
            if (event.target.getAttribute('id') === 'badge_rule') {
                const rule = event.target.value
                const rule_values = JSON.parse(badgeTable.dataset.rules)[rule]
                fillRuleValues(rule_values)
            }
        })
    }
})

const fillRuleValues = (values) => {
    const ruleValues = document.getElementById('badge_rule_value');
    ruleValues.innerHTML = ''
    if (values.length) {
        document.getElementById('rule-value').classList.remove('hide')
    } else {
        document.getElementById('rule-value').classList.add('hide')
    }
    for (const value of values) {
        const elem = document.createElement('option');
        elem.value = value[0];
        elem.textContent = value[1]
        ruleValues.appendChild(elem)
    }
}
