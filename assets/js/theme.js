// Dark mode toggle functionality
(function() {
    const themeToggle = document.getElementById('theme-toggle');
    const themeIcon = themeToggle?.querySelector('.theme-icon');
    const html = document.documentElement;

    // Check for saved theme preference or default to light mode
    const currentTheme = localStorage.getItem('theme') || 'light';
    
    // Apply the saved theme
    if (currentTheme === 'dark') {
        html.classList.add('dark-mode');
        if (themeIcon) themeIcon.textContent = '☀️';
    }

    // Theme toggle handler
    if (themeToggle) {
        themeToggle.addEventListener('click', function() {
            html.classList.toggle('dark-mode');
            
            const isDark = html.classList.contains('dark-mode');
            localStorage.setItem('theme', isDark ? 'dark' : 'light');
            
            if (themeIcon) {
                themeIcon.textContent = isDark ? '☀️' : '🌙';
            }
        });
    }
})();

