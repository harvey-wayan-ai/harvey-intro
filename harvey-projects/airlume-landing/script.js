// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Add animation on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all feature cards and blocks
document.querySelectorAll('.glass-card, .feature-block').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'all 0.6s ease-out';
    observer.observe(el);
});

// CTA Button interaction
const ctaButton = document.querySelector('.btn-cta');
if (ctaButton) {
    ctaButton.addEventListener('click', () => {
        alert('🔍 Flight search feature coming soon! This is a demo page.');
    });
}

// Points counter animation
const pointsNumber = document.querySelector('.points-number');
if (pointsNumber) {
    const targetPoints = 13200;
    let currentPoints = 0;
    const duration = 2000;
    const increment = targetPoints / (duration / 16);
    
    const animatePoints = () => {
        currentPoints += increment;
        if (currentPoints < targetPoints) {
            pointsNumber.textContent = Math.floor(currentPoints).toLocaleString();
            requestAnimationFrame(animatePoints);
        } else {
            pointsNumber.textContent = targetPoints.toLocaleString();
        }
    };
    
    // Start animation when scrolled into view
    const pointsObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animatePoints();
                pointsObserver.unobserve(entry.target);
            }
        });
    });
    
    pointsObserver.observe(pointsNumber);
}

// Add hover effect to feature cards
document.querySelectorAll('.glass-card').forEach(card => {
    card.addEventListener('mouseenter', function() {
        this.style.borderColor = 'rgba(79, 70, 229, 0.5)';
    });
    
    card.addEventListener('mouseleave', function() {
        this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
    });
});

// Console log for demo
console.log('🚀 AirLume.AI Landing Page - Demo Version');
console.log('Built with: HTML, CSS, JavaScript');
console.log('Features: Glassmorphism, Smooth Animations, Responsive Design');
