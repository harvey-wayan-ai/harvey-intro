---
name: web-app-development
description: Standard Operating Procedure for building production-ready web applications with Next.js, focusing on accessibility, security, and design quality through systematic feedback loops and best practices.
---

# Web App Development SOP

**Systematic workflow for building production-ready web applications**

Based on real project learnings (Mofin financial app - built in 40 minutes from scratch to production).

---

## When to Use This Skill

Use this skill when:
- Building new web applications (landing pages, SaaS, internal tools)
- Need systematic quality assurance
- Want reproducible results
- Require accessibility compliance (WCAG AA)
- Building with Next.js, React, TypeScript
- Using modern tooling (Tailwind, Shadcn/UI, Framer Motion)

---

## 8-Phase Development Workflow

### Phase 1: Planning & Setup (5-10 min)

**Define requirements:**
- Purpose of the app
- Key features
- Target audience
- Design preferences

**Choose tech stack:**
```bash
# Core stack (recommended)
- Next.js 16+ (App Router)
- TypeScript
- Tailwind CSS v4
- Shadcn/UI components
- Framer Motion (animations)
```

**Initialize project:**
```bash
npx create-next-app@latest my-app --typescript --tailwind --app

# Configuration:
✅ TypeScript
✅ ESLint
✅ Tailwind CSS
✅ App Router
❌ No src/ directory
✅ Import alias: @/*
```

**Setup deployment:**
```bash
# Create GitHub repo
git init
git remote add origin https://github.com/username/my-app.git

# Configure Vercel
export VERCEL_TOKEN=<your-token>
# Save in ~/.vercel-token for future use
echo "VERCEL_TOKEN=..." > ~/.vercel-token
chmod 600 ~/.vercel-token
```

---

### Phase 2: Initial Development (15-20 min)

**Create basic structure:**
```tsx
// app/page.tsx - Start simple
export default function Home() {
  return (
    <main className="min-h-screen">
      <section className="py-20 px-4 text-center">
        <h1 className="text-5xl font-bold mb-4">Your App Name</h1>
        <p className="text-xl mb-8">Your tagline here</p>
        {/* Basic sections */}
      </section>
    </main>
  );
}
```

**Deploy v1 (MVP):**
```bash
git add -A
git commit -m "Initial Next.js setup with basic structure"
git push -u origin main

# Deploy to Vercel
npx vercel --token $VERCEL_TOKEN --yes --prod
```

**Goal:** Get a live URL quickly for testing and feedback.

---

### Phase 3: Feedback Loop Review (10-15 min)

**Two approaches:**

#### A. Multi-Agent Review (Thorough but slower)

Spawn 6 specialized review agents:

1. **Design Reviewer** - Visual consistency, layout, responsive design
2. **Security Reviewer** - Vulnerabilities, secrets, headers
3. **UX/Accessibility** - ARIA, keyboard nav, WCAG compliance
4. **Fullstack Developer** - Architecture, performance, patterns
5. **Code Quality** - DRY, types, naming, maintainability
6. **QA Tester** - Functionality, edge cases, browser compat

```javascript
// Example agent spawn
await sessions_spawn({
  agentId: 'main',
  label: 'design-review',
  task: `Review https://my-app.vercel.app
  
  Analyze:
  1. Color scheme & brand consistency
  2. Typography hierarchy
  3. Spacing & layout
  4. Mobile responsiveness
  
  Provide score (0-100) and specific improvements.`,
  runTimeoutSeconds: 180,
  cleanup: 'keep'
});
```

**Resource management:**
- Run sequentially (not parallel) on limited resources
- Keep sessions for debugging
- Document findings

#### B. Template-Based Review (Faster)

Use claude-code-templates patterns:

```bash
# Clone templates once
git clone https://github.com/davila7/claude-code-templates.git ~/templates

# Reference during review:
~/templates/cli-tool/components/agents/security/security-auditor.md
~/templates/cli-tool/components/skills/web-development/web-performance-optimization/
```

**Key patterns to check:**
- Security: OWASP Top 10, no hardcoded secrets
- Accessibility: ARIA labels, keyboard nav, contrast
- Performance: Web Vitals (LCP<2.5s, FID<100ms, CLS<0.1)
- Code quality: DRY principle, TypeScript types

**Document findings:**
```bash
mkdir feedback-loop
# Create comprehensive review doc
# Prioritize: Critical → High → Medium → Low
```

---

### Phase 4: Critical Fixes ⭐ (20-30 min)

**MOST IMPORTANT PHASE**

**Priority 1: Accessibility (Highest Impact)**

```tsx
// 1. Skip Navigation
<a
  href="#main-content"
  className="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 bg-primary text-white px-4 py-2 rounded z-50"
>
  Skip to main content
</a>

// 2. Proper Form Labels
<label htmlFor="email" className="sr-only">
  Email address
</label>
<input
  id="email"
  type="email"
  aria-required="true"
  aria-invalid={hasError}
  aria-describedby={errorId}
/>

// 3. Focus Styles (globals.css)
*:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 2px;
  border-radius: 4px;
}

// 4. Semantic HTML
<main id="main-content">
  <article>
    <header>
      <h1>...</h1>
    </header>
    <section aria-labelledby="section-title">
      <h2 id="section-title">...</h2>
    </section>
  </article>
</main>

// 5. Reduced Motion
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

**Priority 2: Security**

```typescript
// next.config.ts
const nextConfig = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: [
          { key: 'X-Frame-Options', value: 'DENY' },
          { key: 'X-Content-Type-Options', value: 'nosniff' },
          { key: 'X-XSS-Protection', value: '1; mode=block' },
          { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
          { key: 'Permissions-Policy', value: 'camera=(), microphone=(), geolocation=()' }
        ]
      }
    ];
  }
};

// Input validation
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!emailRegex.test(email)) {
  // Handle error
}

// Never hardcode secrets
// ❌ const API_KEY = "abc123";
// ✅ const API_KEY = process.env.API_KEY;
```

**Priority 3: Component Architecture**

```bash
# Create modular structure
components/
├── Header.tsx
├── Footer.tsx
├── sections/
│   ├── HeroSection.tsx
│   ├── FeaturesSection.tsx
│   └── PricingSection.tsx
└── ui/              # Shadcn components
    ├── button.tsx
    ├── card.tsx
    └── ...
```

**Priority 4: SEO Metadata**

```typescript
// app/layout.tsx
export const metadata: Metadata = {
  title: 'Your App - Tagline',
  description: 'Comprehensive description for search engines...',
  keywords: ['keyword1', 'keyword2', 'keyword3'],
  openGraph: {
    title: 'Your App',
    description: 'Share description',
    url: 'https://yourapp.com',
    siteName: 'Your App',
    images: [{ url: '/og-image.jpg', width: 1200, height: 630 }],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Your App',
    description: 'Tweet description',
  },
};
```

**Priority 5: Error Handling**

```tsx
// app/error.tsx
'use client';

export default function Error({ error, reset }: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="text-center">
        <h2 className="text-2xl font-bold mb-4">
          Something went wrong!
        </h2>
        <button onClick={reset}>Try again</button>
      </div>
    </div>
  );
}
```

**Commit critical fixes:**
```bash
git add -A
git commit -m "🚀 Critical fixes: Accessibility, Security, SEO, Error handling"
git push
```

---

### Phase 5: Design Upgrade (15-20 min)

**Install Shadcn/UI:**
```bash
npx shadcn@latest init -y

# Add commonly used components
npx shadcn@latest add button card input badge separator tabs accordion dialog
```

**Install Framer Motion:**
```bash
npm install framer-motion clsx tailwind-merge
```

**Create animated hero:**
```tsx
'use client';

import { motion } from 'framer-motion';

export const HeroSection = () => {
  return (
    <section className="relative py-20 bg-gradient-to-br from-violet-600 via-purple-600 to-fuchsia-600">
      {/* Animated background */}
      <div className="absolute inset-0 opacity-20">
        <div className="absolute top-1/4 left-1/4 w-72 h-72 bg-white rounded-full blur-3xl animate-pulse" />
      </div>
      
      <div className="relative z-10 max-w-5xl mx-auto text-center">
        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          className="text-6xl font-bold text-white mb-6"
        >
          Your Headline
        </motion.h1>
        
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="text-xl text-purple-100 mb-8"
        >
          Your subheadline
        </motion.p>
      </div>
    </section>
  );
};
```

**Tabbed features:**
```tsx
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';

export const FeaturesSection = () => (
  <Tabs defaultValue="feature1">
    <TabsList>
      <TabsTrigger value="feature1">💰 Feature 1</TabsTrigger>
      <TabsTrigger value="feature2">📈 Feature 2</TabsTrigger>
    </TabsList>
    <TabsContent value="feature1">
      {/* Feature 1 content */}
    </TabsContent>
  </Tabs>
);
```

**FAQ accordion:**
```tsx
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';

export const FAQSection = () => (
  <Accordion type="single" collapsible>
    <AccordionItem value="q1">
      <AccordionTrigger>Question 1?</AccordionTrigger>
      <AccordionContent>Answer 1</AccordionContent>
    </AccordionItem>
  </Accordion>
);
```

**Color scheme best practices:**
```css
/* Upgrade from basic colors to vibrant gradients */

/* Before */
bg-purple-500 to-pink-500

/* After */
bg-gradient-to-br from-violet-600 via-purple-600 to-fuchsia-600

/* Why: */
- violet more vibrant than purple
- fuchsia better accent than pink
- via creates smooth transition
- Better WCAG contrast
```

**Commit design upgrades:**
```bash
git add -A
git commit -m "🎨 Design upgrade: Shadcn/UI + Framer Motion animations"
git push
```

---

### Phase 6: Quality Assurance (10 min)

**Quality checklist:**

```markdown
## Pre-Deployment Checklist

### Functionality
- [ ] All forms work (submit, validation)
- [ ] All buttons clickable
- [ ] Navigation works (smooth scroll, links)
- [ ] Loading states visible
- [ ] Error states handled

### Accessibility
- [ ] Keyboard navigation works (Tab, Enter, Esc)
- [ ] Focus styles visible
- [ ] ARIA labels present
- [ ] Screen reader compatible (test if possible)
- [ ] Color contrast WCAG AA minimum (4.5:1)
- [ ] Heading hierarchy correct (h1 → h2 → h3)

### Security
- [ ] No hardcoded secrets in code
- [ ] Security headers configured
- [ ] Input validation present
- [ ] HTTPS enforced
- [ ] Environment variables used

### SEO
- [ ] Metadata complete (title, description)
- [ ] OpenGraph tags present
- [ ] Twitter cards configured
- [ ] Semantic HTML used
- [ ] Alt text on images

### Performance
- [ ] Lighthouse score > 85
- [ ] No console errors
- [ ] Images optimized
- [ ] Bundle size reasonable

### Responsiveness
- [ ] Mobile (375px+)
- [ ] Tablet (768px+)
- [ ] Desktop (1024px+)
- [ ] Touch targets min 44x44px
```

**Run Lighthouse:**
```bash
# In Chrome DevTools
# Lighthouse > Generate report
# Target: 85+ for all categories
```

**Test browsers:**
- Chrome (primary)
- Firefox
- Safari (if available)
- Mobile Chrome/Safari

---

### Phase 7: Documentation (10 min)

**Create project README:**

```markdown
# Your App Name

Description of your app.

## Tech Stack

- Next.js 16
- TypeScript
- Tailwind CSS v4
- Shadcn/UI
- Framer Motion

## Getting Started

\`\`\`bash
npm install
npm run dev
\`\`\`

## Deployment

Deployed on Vercel: https://yourapp.vercel.app

## Features

- Feature 1
- Feature 2
- Feature 3

## Development

Built using [Web App Development SOP](../../.claude/skills/web-app-development/SKILL.md)

## License

MIT
```

**Update this SOP:**
- Note what worked well
- Note what didn't work
- Add new patterns discovered
- Update time estimates

---

### Phase 8: Deploy & Monitor (5 min)

**Final deployment:**
```bash
# Final commit
git add -A
git commit -m "🚀 Production ready - All QA checks passed"
git push

# Verify deployment
curl -I https://yourapp.vercel.app
# Should return HTTP/2 200

# Check deployment logs
npx vercel logs yourapp.vercel.app --follow
```

**Post-deployment checks:**
- [ ] URL loads
- [ ] All features work
- [ ] No console errors
- [ ] Analytics tracking (if configured)
- [ ] Forms submit properly

---

## Time Estimates

| Phase | Time | Priority |
|-------|------|----------|
| Planning & Setup | 5-10 min | High |
| Initial Development | 15-20 min | High |
| Feedback Loop | 10-15 min | Medium |
| **Critical Fixes** | **20-30 min** | **CRITICAL** |
| Design Upgrade | 15-20 min | Medium |
| Quality Assurance | 10 min | High |
| Documentation | 10 min | Medium |
| Deploy & Monitor | 5 min | High |
| **TOTAL** | **90-120 min** | - |

---

## Common Problems & Solutions

### Problem: Build fails with "Event handlers cannot be passed to Server Component"

**Solution:** Add `'use client'` to top of component:
```tsx
'use client';

// Now you can use onClick, useState, etc.
export default function MyComponent() {
  const [state, setState] = useState();
  // ...
}
```

### Problem: Deployment shows old version

**Solution:** 
```bash
# Clear Vercel cache
touch app/page.tsx
git commit --allow-empty -m "Force rebuild"
git push

# Or rebuild via Vercel dashboard
```

### Problem: Metadata not showing in social shares

**Solution:** Metadata must be in layout.tsx or page.tsx (server component):
```tsx
// app/layout.tsx (not page.tsx if it's 'use client')
export const metadata: Metadata = { ... };
```

### Problem: Animations not working

**Solution:** Ensure component is client component:
```tsx
'use client';

import { motion } from 'framer-motion';
```

### Problem: Shadcn components not found

**Solution:** 
```bash
# Install shadcn first
npx shadcn@latest init -y

# Then add components
npx shadcn@latest add button card
```

---

## Best Practices

### Accessibility First
- Always start with semantic HTML
- Add ARIA when semantics aren't enough
- Test keyboard navigation early
- Use focus-visible for focus styles
- Maintain 4.5:1 contrast ratio minimum

### Security
- Never commit secrets to Git
- Use environment variables
- Add security headers
- Validate all user input
- Use HTTPS only

### Performance
- Lazy load below-the-fold content
- Optimize images (Next.js Image component)
- Code split large components
- Monitor Web Vitals
- Set performance budget

### Code Quality
- Follow DRY principle
- Use TypeScript for type safety
- Extract reusable components
- Meaningful names (not "data", "item", "thing")
- Comment complex logic only

---

## Tools & Resources

**Essential tools:**
```bash
# Component library
npx shadcn@latest add <component>

# Animations
npm install framer-motion

# Icons
npm install lucide-react

# Forms
npm install react-hook-form zod @hookform/resolvers
```

**Reference materials:**
- Shadcn/UI: https://ui.shadcn.com
- Framer Motion: https://www.framer.com/motion
- Next.js: https://nextjs.org/docs
- WCAG: https://www.w3.org/WAI/WCAG21/quickref
- Web Vitals: https://web.dev/vitals

**Template repository:**
```bash
git clone https://github.com/davila7/claude-code-templates.git
# 600+ agents, 200+ commands, 55+ MCPs, skills
```

---

## Results to Expect

**Quality scores (target):**
- Overall: 85/100+
- Accessibility: 90/100+
- Security: 92/100+
- Performance: 85/100+
- SEO: 90/100+

**Lighthouse scores:**
- Performance: 85+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 95+

**Time investment:**
- Simple project: ~60 minutes
- Medium project: ~90 minutes
- Complex project: ~120 minutes

**Improvements from following SOP:**
- +40-50% quality score improvement
- WCAG AA compliance
- Production-ready code
- Maintainable architecture
- Consistent results

---

## Continuous Improvement

**After each project:**

1. **Review:** What worked? What didn't?
2. **Measure:** Compare time estimates vs actual
3. **Document:** Add new patterns discovered
4. **Update:** Revise this SKILL.md
5. **Commit:** Push improvements to Git

**Version control this skill:**
```bash
cd ~/.claude/skills/web-app-development
git add SKILL.md
git commit -m "Update SOP based on [project-name] learnings"
git push
```

---

## Example Projects

**Projects built with this SOP:**

1. **Mofin Financial App**
   - Duration: 40 minutes
   - Score: 58 → 85/100 (+46%)
   - Features: Animations, tabs, accordion, forms
   - Tech: Next.js 16, Shadcn/UI, Framer Motion

---

## Quick Start Template

```bash
# Copy this into your project root after Phase 1
cat > README.md << 'EOF'
# [Your App Name]

Built using Web App Development SOP

## Quick Commands

\`\`\`bash
npm install          # Install dependencies
npm run dev          # Start dev server
npm run build        # Production build
npx vercel --prod    # Deploy to Vercel
\`\`\`

## Checklist

- [ ] Phase 1: Planning & Setup
- [ ] Phase 2: Initial Development
- [ ] Phase 3: Feedback Loop
- [ ] Phase 4: Critical Fixes ⭐
- [ ] Phase 5: Design Upgrade
- [ ] Phase 6: Quality Assurance
- [ ] Phase 7: Documentation
- [ ] Phase 8: Deploy & Monitor

EOF
```

---

**Next project? Follow this SOP step-by-step! 🚀**
