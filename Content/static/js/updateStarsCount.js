document.addEventListener('DOMContentLoaded', function () {
    const el = document.getElementById('main-page-callout-stars-count');
    // The localised label carries a `{count}` placeholder (set server-side as a
    // `data-stars-template` attribute) so word order works in every language.
    const template = (el && el.dataset.starsTemplate) || '{count} stars on GitHub';
    fetch('https://api.github.com/repos/vapor/vapor')
        .then(response => response.json())
        .then(data => {
            const starCount = data.stargazers_count.toLocaleString();
            el.textContent = template.replace('{count}', starCount);
        })
        .catch(error => {
            console.error('Error fetching star count:', error);
            el.textContent = template.replace('{count}', '24k');
        });
});
