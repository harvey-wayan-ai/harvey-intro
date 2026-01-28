# Free Web App Templates Collection

Curated list of high-quality, free templates for Next.js web applications.

**Last updated:** 2026-01-28

---

## 🎯 How to Use

```bash
# Clone template
git clone <template-url> my-project
cd my-project

# Or use create-next-app with example
npx create-next-app my-app --example <github-url>

# Install & run
npm install
npm run dev
```

---

## 🏆 Top Tier Templates (Production-Ready)

### 1. Shadcn Taxonomy
**Best for:** SaaS, blogging platform, content-heavy sites  
**URL:** https://github.com/shadcn-ui/taxonomy  
**⭐ Stars:** 18k+

**Features:**
- ✅ Authentication (NextAuth.js)
- ✅ Database (Prisma)
- ✅ Billing (Stripe)
- ✅ Blog with MDX
- ✅ Dashboard
- ✅ Shadcn/UI components
- ✅ Dark mode
- ✅ TypeScript

**Tech Stack:**
- Next.js 14 (App Router)
- Prisma ORM
- Tailwind CSS
- Shadcn/UI
- NextAuth.js
- Stripe

**Install:**
```bash
git clone https://github.com/shadcn-ui/taxonomy.git
cd taxonomy
cp .env.example .env.local
# Configure DATABASE_URL, NEXTAUTH_SECRET, etc.
npm install
npm run dev
```

**Pros:**
- Created by Shadcn (UI library creator)
- Production-ready
- Well-documented
- Active maintenance

**Cons:**
- Complex setup (requires database)
- Overkill for simple landing pages

---

### 2. Next.js SaaS Stripe Starter
**Best for:** SaaS with subscriptions  
**URL:** https://github.com/vercel/nextjs-subscription-payments  
**⭐ Stars:** 5k+

**Features:**
- ✅ Stripe Checkout
- ✅ Stripe Customer Portal
- ✅ Webhook handling
- ✅ Supabase auth & database
- ✅ Pricing page
- ✅ Account management

**Tech Stack:**
- Next.js 14
- Supabase
- Stripe
- Tailwind CSS

**Install:**
```bash
npx create-next-app -e https://github.com/vercel/nextjs-subscription-payments
```

**Pros:**
- Official Vercel template
- Complete billing system
- Supabase integration

**Cons:**
- Requires Stripe & Supabase accounts
- Focused on subscriptions

---

### 3. Next.js Commerce
**Best for:** E-commerce, product showcase  
**URL:** https://github.com/vercel/commerce  
**⭐ Stars:** 11k+

**Features:**
- ✅ Shopping cart
- ✅ Product pages
- ✅ Search
- ✅ Multiple commerce backends
- ✅ Performance optimized
- ✅ SEO friendly

**Tech Stack:**
- Next.js 14
- Tailwind CSS
- Shopify/BigCommerce/etc integration

**Install:**
```bash
npx create-next-app -e https://github.com/vercel/commerce
```

**Pros:**
- Best-in-class e-commerce
- Multiple backend options
- Beautiful design

**Cons:**
- E-commerce specific
- Requires commerce platform

---

## 🎨 Landing Page Templates

### 4. Aceternity UI
**Best for:** Modern landing pages with animations  
**URL:** https://ui.aceternity.com  
**Free components:** Yes

**Features:**
- ✅ 50+ animated components
- ✅ Copy-paste ready
- ✅ Framer Motion based
- ✅ Beautiful gradients
- ✅ Dark mode
- ✅ TypeScript

**Install:**
```bash
# Individual components
npx aceternity-ui@latest add hero-section
npx aceternity-ui@latest add bento-grid
```

**Pros:**
- Stunning animations
- Modern design
- Easy to customize

**Cons:**
- Not full template (components only)
- Need to compose yourself

---

### 5. Shadcn Landing Page
**Best for:** Simple, clean landing pages  
**URL:** https://github.com/leoMirandaa/shadcn-landing-page  
**⭐ Stars:** 2k+

**Features:**
- ✅ Hero section
- ✅ Features grid
- ✅ Pricing table
- ✅ FAQ accordion
- ✅ Testimonials
- ✅ CTA sections
- ✅ Shadcn/UI

**Tech Stack:**
- Next.js 14
- Shadcn/UI
- Tailwind CSS

**Install:**
```bash
git clone https://github.com/leoMirandaa/shadcn-landing-page.git
cd shadcn-landing-page
npm install
npm run dev
```

**Pros:**
- Simple & clean
- No complex setup
- Ready to customize

**Cons:**
- Basic features only
- No animations

---

### 6. NextUI Landing Template
**Best for:** Clean, professional landing pages  
**URL:** https://github.com/nextui-org/nextui  
**Component library**

**Features:**
- ✅ Modern UI components
- ✅ Framer Motion animations
- ✅ Dark mode
- ✅ Responsive
- ✅ TypeScript

**Install:**
```bash
npm install @nextui-org/react framer-motion
```

**Pros:**
- Beautiful components
- Good documentation
- Active development

**Cons:**
- Components library (not full template)
- Different from Shadcn ecosystem

---

## 💼 SaaS Templates

### 7. Shipfast (Paid but worth mentioning)
**Best for:** Complete SaaS starter  
**URL:** https://shipfa.st  
**Price:** $199 (one-time)

**Features:**
- ✅ Auth (Google, Email)
- ✅ Payments (Stripe)
- ✅ Database (MongoDB/Supabase)
- ✅ Email (Mailgun)
- ✅ Landing page
- ✅ Dashboard
- ✅ SEO optimized

**Note:** Paid, but saves weeks of work

---

### 8. Next SaaS Starter Kit (Free)
**Best for:** Simple SaaS MVP  
**URL:** https://github.com/leerob/nextjs-saas-starter  
**⭐ Stars:** 3k+

**Features:**
- ✅ Landing page
- ✅ Auth (Clerk)
- ✅ Database (Drizzle ORM)
- ✅ Forms (React Hook Form)
- ✅ TypeScript
- ✅ ESLint

**Install:**
```bash
git clone https://github.com/leerob/nextjs-saas-starter.git
```

**Pros:**
- Modern stack
- Well-structured
- Good starting point

**Cons:**
- Basic features
- Requires configuration

---

## 🎭 Portfolio & Personal Sites

### 9. Next.js Portfolio Template
**Best for:** Developer portfolios  
**URL:** https://github.com/craftzdog/craftzdog-homepage  
**⭐ Stars:** 6k+

**Features:**
- ✅ Beautiful animations
- ✅ Project showcase
- ✅ About page
- ✅ Contact form
- ✅ Dark mode
- ✅ Framer Motion

**Install:**
```bash
git clone https://github.com/craftzdog/craftzdog-homepage.git
```

**Pros:**
- Unique design
- Great animations
- Inspiring

**Cons:**
- Very specific design
- Hard to customize

---

### 10. Simple Portfolio
**Best for:** Minimalist portfolios  
**URL:** https://github.com/BraydenTW/create-t3-app  
**Based on T3 stack**

**Features:**
- ✅ Type-safe
- ✅ tRPC
- ✅ Prisma
- ✅ NextAuth
- ✅ Tailwind

**Install:**
```bash
npm create t3-app@latest
```

**Pros:**
- Type-safe full-stack
- Modern tooling
- Great DX

---

## 🚀 Quick Start Templates (No Setup)

### 11. Next.js Tailwind Starter
**Best for:** Blank canvas with essentials  
**URL:** Official Next.js  

**Install:**
```bash
npx create-next-app@latest --typescript --tailwind --app
```

**Pros:**
- Official template
- Minimal setup
- Clean slate

---

### 12. Shadcn/UI Starter
**Best for:** Component-first development  
**URL:** https://ui.shadcn.com

**Install:**
```bash
npx create-next-app@latest my-app
cd my-app
npx shadcn@latest init
npx shadcn@latest add button card input badge tabs accordion
```

**Pros:**
- Best component library
- Copy-paste components
- Highly customizable

---

## 🎬 Animation-Heavy Templates

### 13. Framer Motion Examples
**Best for:** Learning animations  
**URL:** https://github.com/framer/motion/tree/main/packages/framer-motion/src/examples  

**Features:**
- ✅ Animation examples
- ✅ Gesture handling
- ✅ Layout animations
- ✅ SVG animations

**Use:** Copy patterns into your project

---

### 14. Magic UI
**Best for:** Fancy UI effects  
**URL:** https://magicui.design  

**Features:**
- ✅ 50+ animated components
- ✅ Copy-paste
- ✅ Beautiful effects
- ✅ TypeScript

**Install:**
```bash
npx magicui-cli@latest add hero-video-dialog
```

**Pros:**
- Stunning effects
- Easy integration

**Cons:**
- Can be overwhelming
- Performance consideration

---

## 📚 Template Collections & Marketplaces

### 15. Vercel Templates
**URL:** https://vercel.com/templates  
**Free:** Yes

**Categories:**
- Next.js starters
- E-commerce
- AI apps
- Marketing sites
- Documentation sites

**How to use:**
```bash
# Click "Deploy" on Vercel
# Or clone repository
```

---

### 16. Tailwind UI (Paid)
**URL:** https://tailwindui.com  
**Price:** $149-299

**Features:**
- 500+ components
- Complete page examples
- Application UI
- Marketing sections

**Note:** Paid but very high quality

---

### 17. Headless UI
**URL:** https://headlessui.com  
**Free:** Yes

**Features:**
- ✅ Unstyled components
- ✅ Accessible
- ✅ Works with Tailwind
- ✅ React & Vue

**Install:**
```bash
npm install @headlessui/react
```

---

## 🔧 Specialized Templates

### 18. AI ChatGPT Clone
**Best for:** Chat applications  
**URL:** https://github.com/mckaywrigley/chatbot-ui  
**⭐ Stars:** 28k+

**Features:**
- ✅ OpenAI integration
- ✅ Chat interface
- ✅ Markdown support
- ✅ Dark mode

---

### 19. Admin Dashboard
**Best for:** Admin panels, dashboards  
**URL:** https://github.com/horizon-ui/horizon-ui-chakra-nextjs  
**⭐ Stars:** 1k+

**Features:**
- ✅ Charts & graphs
- ✅ Tables
- ✅ Forms
- ✅ Analytics pages

---

### 20. Documentation Site
**Best for:** Technical docs  
**URL:** https://nextra.site  
**⭐ Stars:** 11k+

**Features:**
- ✅ MDX support
- ✅ Search
- ✅ Dark mode
- ✅ Code highlighting

**Install:**
```bash
npx create-nextra-app@latest
```

---

## 🎯 Recommended Workflow

### For Landing Pages:
1. Start with **Shadcn Landing Page**
2. Add components from **Aceternity UI** or **Magic UI**
3. Use **Framer Motion** for custom animations

### For SaaS:
1. Start with **Shadcn Taxonomy** or **Next SaaS Starter**
2. Add **Stripe** for payments
3. Use **Supabase** or **Prisma** for database

### For E-commerce:
1. Use **Next.js Commerce**
2. Connect to Shopify/etc
3. Customize design

### For Quick Prototypes:
1. `npx create-next-app --typescript --tailwind`
2. `npx shadcn@latest init`
3. Add components as needed

---

## 🚦 Template Selection Guide

**Choose based on:**

| Need | Template |
|------|----------|
| Simple landing page | Shadcn Landing Page |
| Modern animations | Aceternity UI components |
| Full SaaS | Shadcn Taxonomy |
| E-commerce | Next.js Commerce |
| Subscription billing | Next.js SaaS Stripe Starter |
| Portfolio | Craftzdog Homepage |
| Admin dashboard | Horizon UI |
| Documentation | Nextra |
| Chat app | Chatbot UI |
| Quick start | Official Next.js + Shadcn |

---

## 💡 Pro Tips

**1. Start Simple:**
Don't use Taxonomy for a simple landing page. Start with basics.

**2. Mix & Match:**
Clone a landing page, add components from Aceternity or Magic UI.

**3. Check Dependencies:**
Some templates have many dependencies. Keep it lean.

**4. Customize:**
Templates are starting points, not final products. Make it yours.

**5. Check Updates:**
Use actively maintained templates. Check last commit date.

**6. Learn Patterns:**
Study how templates solve problems. Apply patterns to your work.

---

## 🔗 Resources

**Component Libraries:**
- Shadcn/UI: https://ui.shadcn.com
- Aceternity UI: https://ui.aceternity.com
- Magic UI: https://magicui.design
- NextUI: https://nextui.org
- Headless UI: https://headlessui.com

**Animation:**
- Framer Motion: https://www.framer.com/motion
- GSAP: https://greensock.com/gsap
- Lottie: https://lottiefiles.com

**Icons:**
- Lucide: https://lucide.dev
- Hero Icons: https://heroicons.com
- React Icons: https://react-icons.github.io/react-icons

**Colors:**
- Coolors: https://coolors.co
- UI Colors: https://uicolors.app
- Tailwind Shades: https://www.tailwindshades.com

**Inspiration:**
- Dribbble: https://dribbble.com
- Awwwards: https://www.awwwards.com
- Land-book: https://land-book.com
- SaaS Landing Pages: https://saaslandingpage.com

---

## 📝 Template Evaluation Checklist

Before using a template, check:

- [ ] Last updated within 6 months?
- [ ] Active GitHub issues/PRs?
- [ ] Good documentation?
- [ ] Dependencies up-to-date?
- [ ] TypeScript support?
- [ ] Responsive design?
- [ ] Accessibility features?
- [ ] Performance optimized?
- [ ] Easy to customize?
- [ ] License permissive (MIT)?

---

## 🎓 Learning from Templates

**What to study:**
1. File structure organization
2. Component patterns
3. State management approaches
4. Animation techniques
5. Form handling
6. Error boundaries
7. Loading states
8. Responsive breakpoints
9. Color schemes
10. Typography scales

**How to learn:**
```bash
# Clone template
git clone <template-url>

# Study structure
tree -L 3

# Read key files
# - components/
# - app/ or pages/
# - lib/
# - styles/

# Run locally
npm install
npm run dev

# Modify and experiment
# Change colors, layouts, add features
```

---

## 🔄 Keep This Updated

**After using a template:**
1. Rate it (quality, ease of use)
2. Note pros/cons
3. Add to this list if exceptional
4. Remove if deprecated

**Contribute:**
```bash
cd ~/.claude/skills/web-app-development
git add TEMPLATES.md
git commit -m "Update templates: Added [template-name]"
git push
```

---

**Last reviewed:** 2026-01-28  
**Next review:** 2026-02-28

---

**Found a great template? Add it here! 🚀**
