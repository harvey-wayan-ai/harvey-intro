# Web App Development Skill

**Production-ready web applications in 90-120 minutes**

Based on real-world project learnings with proven workflows and quality assurance.

---

## 📁 Files in This Skill

### 1. SKILL.md (17.5KB)
**The main SOP** - Complete 8-phase development workflow

**Contents:**
- Phase 1: Planning & Setup (5-10 min)
- Phase 2: Initial Development (15-20 min)
- Phase 3: Feedback Loop Review (10-15 min)
- Phase 4: **Critical Fixes ⭐ (20-30 min)** - MOST IMPORTANT
- Phase 5: Design Upgrade (15-20 min)
- Phase 6: Quality Assurance (10 min)
- Phase 7: Documentation (10 min)
- Phase 8: Deploy & Monitor (5 min)

**Also includes:**
- Accessibility patterns (WCAG AA)
- Security best practices
- Component architecture
- Common problems & solutions
- Quality checklists
- Tools & resources

**When to use:** Every new web app project

---

### 2. TEMPLATES.md (12.5KB)
**Curated template collection** - 20+ free & paid templates

**Categories:**
- 🏆 Top Tier (Taxonomy, Commerce, SaaS Stripe)
- 🎨 Landing Pages (Aceternity, Shadcn Landing)
- 💼 SaaS (Next SaaS Starter)
- 🎭 Portfolio (Craftzdog)
- 🔧 Specialized (ChatGPT Clone, Admin, Docs)

**Includes:**
- Installation commands
- Pros/cons for each
- Selection guide
- Evaluation checklist

**When to use:** Starting new project, need inspiration

---

### 3. README.md (This file)
**Quick reference** - Overview and quick access

---

## 🚀 Quick Start

### New Project from Scratch

```bash
# 1. Follow SKILL.md workflow
cat ~/.claude/skills/web-app-development/SKILL.md

# 2. Or ask Harvey
"Follow web-app-development skill to build [project-name]"
```

### New Project from Template

```bash
# 1. Browse templates
cat ~/.claude/skills/web-app-development/TEMPLATES.md

# 2. Clone chosen template
git clone <template-url> my-project

# 3. Customize using SKILL.md best practices
```

---

## 📊 Expected Results

Following this skill delivers:

**Quality Scores:**
- Overall: 85/100+
- Accessibility: 90/100+
- Security: 92/100+
- Performance: 85/100+

**Lighthouse Scores:**
- Performance: 85+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 95+

**Time Investment:**
- Simple project: ~60 minutes
- Medium project: ~90 minutes
- Complex project: ~120 minutes

**Consistency:**
- Reproducible workflow
- Predictable quality
- WCAG AA compliance
- Production-ready code

---

## 🎯 Use Cases

This skill is perfect for:

✅ **Landing Pages**
- Marketing sites
- Product launches
- Campaign pages

✅ **SaaS Applications**
- Web apps
- Dashboards
- Admin panels

✅ **Internal Tools**
- Business tools
- Team portals
- Management systems

✅ **Portfolio Sites**
- Developer portfolios
- Agency sites
- Showcase sites

✅ **E-commerce**
- Product catalogs
- Shopping carts
- Checkout flows

---

## 🔧 Tech Stack

**Default stack (recommended):**
- Next.js 16+ (App Router)
- TypeScript
- Tailwind CSS v4
- Shadcn/UI components
- Framer Motion (animations)

**Why this stack:**
- Modern & maintained
- Great DX (Developer Experience)
- Production-proven
- Excellent performance
- Strong ecosystem

---

## 📚 Learning Path

### Beginner
1. Read SKILL.md overview
2. Build simple landing page
3. Follow all 8 phases
4. Study TEMPLATES.md patterns

### Intermediate
1. Use templates as starting point
2. Customize heavily
3. Add complex features
4. Optimize performance

### Advanced
1. Mix multiple templates
2. Create custom components
3. Build design systems
4. Contribute to this skill

---

## 🔄 Continuous Improvement

**After each project:**

1. **Measure:**
   - Time vs estimates
   - Quality scores
   - Issues encountered

2. **Document:**
   - What worked well
   - What didn't work
   - New patterns discovered

3. **Update:**
   ```bash
   cd ~/.claude/skills/web-app-development
   # Edit SKILL.md or TEMPLATES.md
   git add .
   git commit -m "Update: [description]"
   git push
   ```

4. **Share:**
   - New templates found
   - Better approaches
   - Solved problems

---

## 📝 Project Examples

**Built with this skill:**

### Mofin Financial App
- **Duration:** 40 minutes
- **Score improvement:** 58 → 85/100 (+46%)
- **Features:** Animations, tabs, accordion, forms
- **Tech:** Next.js 16, Shadcn/UI, Framer Motion
- **URL:** https://mofin-nextjs.vercel.app
- **GitHub:** https://github.com/harvey-wayan-ai/mofin-nextjs

*(Add your projects here as you build them)*

---

## 🎓 Key Principles

### 1. Accessibility First
- WCAG AA compliance minimum
- Keyboard navigation
- Screen reader support
- Semantic HTML

### 2. Security by Default
- No hardcoded secrets
- Security headers
- Input validation
- HTTPS only

### 3. Performance Matters
- Web Vitals targets (LCP<2.5s, FID<100ms, CLS<0.1)
- Lazy loading
- Image optimization
- Code splitting

### 4. Quality Over Speed
- Better to spend 30 min on accessibility than skip it
- Critical fixes are non-negotiable
- QA checklist before deploy

### 5. Consistency
- Same workflow every time
- Predictable results
- Maintainable code

---

## 🛠️ Essential Tools

**Install once, use everywhere:**

```bash
# Shadcn/UI
npx shadcn@latest init

# Components
npx shadcn@latest add button card input badge tabs accordion

# Animations
npm install framer-motion

# Icons
npm install lucide-react

# Forms
npm install react-hook-form zod @hookform/resolvers

# Deployment
npm install -g vercel
```

---

## 📖 Quick Reference

### Phase Checklist

```markdown
## Project: [Name]

- [ ] Phase 1: Planning & Setup
  - [ ] Requirements defined
  - [ ] Tech stack chosen
  - [ ] Project initialized
  - [ ] Git + Vercel configured

- [ ] Phase 2: Initial Development
  - [ ] Basic structure created
  - [ ] Placeholder content added
  - [ ] v1 deployed

- [ ] Phase 3: Feedback Loop
  - [ ] Reviews completed
  - [ ] Issues documented
  - [ ] Priorities set

- [ ] Phase 4: Critical Fixes ⭐
  - [ ] Accessibility (ARIA, keyboard)
  - [ ] Security (headers, validation)
  - [ ] Component architecture
  - [ ] SEO metadata
  - [ ] Error handling

- [ ] Phase 5: Design Upgrade
  - [ ] Shadcn/UI installed
  - [ ] Framer Motion added
  - [ ] Animations implemented
  - [ ] Colors upgraded

- [ ] Phase 6: Quality Assurance
  - [ ] All forms work
  - [ ] Keyboard nav works
  - [ ] Lighthouse > 85
  - [ ] Mobile responsive
  - [ ] No console errors

- [ ] Phase 7: Documentation
  - [ ] README.md created
  - [ ] Code commented
  - [ ] SOP updated

- [ ] Phase 8: Deploy & Monitor
  - [ ] Final commit
  - [ ] Production deployed
  - [ ] URL verified
  - [ ] Monitoring setup
```

---

## 🔗 Resources

**Main Files:**
- [SKILL.md](./SKILL.md) - Complete workflow
- [TEMPLATES.md](./TEMPLATES.md) - Template collection

**External:**
- [Shadcn/UI](https://ui.shadcn.com)
- [Next.js Docs](https://nextjs.org/docs)
- [Framer Motion](https://www.framer.com/motion)
- [WCAG Guidelines](https://www.w3.org/WAI/WCAG21/quickref)
- [Web Vitals](https://web.dev/vitals)

**Template Repository:**
- [Claude Code Templates](https://github.com/davila7/claude-code-templates)

---

## 💬 How to Use This Skill

### Option 1: Ask Harvey
```
"Follow web-app-development skill to build a landing page for [product]"
```

Harvey will:
1. Load SKILL.md
2. Follow 8-phase workflow
3. Apply all best practices
4. Deliver production-ready app

### Option 2: Manual Reference
```bash
# Read the SOP
cat ~/.claude/skills/web-app-development/SKILL.md

# Browse templates
cat ~/.claude/skills/web-app-development/TEMPLATES.md

# Follow step-by-step
```

### Option 3: Template First
```bash
# Pick template from TEMPLATES.md
# Clone it
# Customize using SKILL.md best practices
```

---

## 🎯 Success Criteria

Project is ready when:

✅ Lighthouse scores all 85+  
✅ WCAG AA compliant  
✅ All forms functional  
✅ No console errors  
✅ Mobile responsive  
✅ Security headers configured  
✅ SEO metadata complete  
✅ Error boundaries added  
✅ Loading states visible  
✅ Deployed to production  

---

## 📌 Version

**Version:** 1.0  
**Created:** 2026-01-28  
**Based on:** Mofin project learnings  
**Last updated:** 2026-01-28  

---

## 🚀 Get Started

```bash
# For your next project:
1. Read this README
2. Choose: SKILL.md workflow OR TEMPLATES.md starting point
3. Build following best practices
4. Update this skill with learnings
5. Repeat
```

**Every project makes this skill better! 🌟**
