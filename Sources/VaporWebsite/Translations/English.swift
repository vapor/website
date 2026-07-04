// English strings + Language for the Vapor website. Copy the keys from
// englishStrings (in English.swift) — anything omitted falls back to English.
import Kiln

let englishStrings: [String: String] = [
    // Shared design-partial config. These are the same across all languages, so
    // they live only in English (the default) and every locale falls back to them.
    "siteId": "main",                 // footer/header link-target branching
    "nav.brandText": "Vapor",         // header logo text + aria-label
    "head.defaultOgType": "website",  // og:type for non-home, non-post pages
    "head.homeSuffix": "",            // appended to site.name on the home page
    "head.titleSeparator": " | ",     // between page title and site.name
    // Navigation / footer chrome not covered by the built-in `strings.*` set.
    "nav.closeMenu": "Close menu",
    "nav.documentation": "Documentation",
    "nav.frameworkDocs": "Framework Docs",
    "footer.frameworkDocs": "Framework Docs",
    "nav.frameworkDocs.caption": "Learn how to use Vapor",
    "nav.apiDocs": "API Docs",
    "footer.apiDocs": "API Docs",
    "nav.apiDocs.caption": "Reference documentation for Vapor",
    "nav.selectTheme": "Select theme",
    "footer.joinDiscord": "Join our Discord",
    "footer.supporters": "Supporters",
    "comingSoon.message": "This page is still under construction, stay tuned for updates!",
    // Stub ("coming soon") page titles — drive the localised H1 + <title> via each
    // page's `titleKey` front-matter field. (Some of these pages will get real
    // implementations later; these keep the placeholders localised in the meantime.)
    "pages.showcase.title": "Showcase",
    "pages.team.title": "Team",
    "pages.supporters.title": "Supporters",
    "pages.evangelists.title": "Evangelists",
    // Calls to action (shared across sections).
    "cta.getStarted": "Get Started",
    "cta.learnMore": "Learn More",
    "cta.seeInAction": "See it in action",
    // Home — hero.
    "home.hero.title": "Swift, but on a server",
    "home.hero.caption": "Vapor provides a safe, performant and easy to use foundation to build HTTP servers, backends and APIs in Swift",
    "footer.tagline": "Vapor provides a safe, performant and easy to use foundation to build HTTP servers, backends and APIs in Swift",
    // `{count}` is filled in by updateStarsCount.js with the live GitHub star count.
    "home.hero.stars": "{count} stars on GitHub",
    "home.hero.starsLoading": "… stars on GitHub",
    // Home — companies.
    "home.companies.caption": "Powering companies like:",
    // Home — packages.
    "home.packages.title": "Build server side with the tooling you already understand",
    "home.packages.caption": "No need to learn a language from scratch (or assemble a different team) just for your backend. Vapor is built on Apple’s SwiftNIO so you’ll get to use the language you already know and love.",
    // Package feature cards (the card titles — Vapor/Fluent/JWT/Leaf — are product
    // names and stay untranslated; only the descriptions are localised).
    "home.packages.vapor.description": "Build efficient APIs in a language you love. Create routes, send and receive JSON and build HTTP servers.",
    "home.packages.fluent.description": "Create models and interact with your database in native, safe Swift code without needing to write any SQL",
    "home.packages.jwt.description": "Create, sign and verify JSON Web Tokens in Swift. Built on top of Swift Crypto",
    "home.packages.leaf.description": "A templating engine written in Swift. Generate HTML for both web apps and emails with a simple syntax anyone can use",
    // Home — features.
    "home.features.performance.title": "High-performant APIs and servers",
    "home.features.performance.description": "Built with a non-blocking, event-driven architecture, Vapor allows you to build high-performant, scalable APIs and HTTP servers. Using Swift's Concurrency model, you can write clear, maintainable code that's efficient and easy to read.",
    "home.features.confidence.title": "Ship with confidence, even on Fridays",
    "home.features.confidence.description": "With Vapor's expressive, protocol oriented design, you'll have peace of mind when shipping your code. With our strong type-safety focus, many errors and problems are caught early on by the compiler.",
    // Home — integrations.
    "home.integrations.label": "Integrations",
    "home.integrations.title": "Full integration with your entire stack",
    "home.integrations.description": "Vapor's mature ecosystem includes over a hundred official and community maintained server-first Swift packages to make building your applications easy and efficient.",
    // Home — showcase.
    "home.showcase.title": "Used by the teams behind these amazing apps",
    "home.showcase.seeFullList": "See full list",
    "home.showcase.prev": "Previous Showcase",
    "home.showcase.next": "Next Showcase",
    // Home — discord.
    "home.discord.title": "Join the largest community of Swift backend developers",
    "home.discord.description": "Vapor's 13k+ Discord community will be at your side to support you along the way. Ask questions, contribute and be a part of a thriving, wholesome corner of the internet.",
    "home.discord.contribute": "Contribute",
    // Home — API docs.
    "home.apiDocs.title": "Get all the tools you need to build with Swift",
    "home.apiDocs.goToApiDocs": "Go to API Docs",
    "home.apiDocs.item1": "Easily create new projects with the Vapor Toolbox",
    "home.apiDocs.item2": "Expansive documentation and API reference",
    "home.apiDocs.item3": "Everything you need to build backends and APIs",
    "home.apiDocs.item4": "Full support for Swift's concurrency model",
    // Home — sponsors.
    "home.sponsors.title": "Supported by our incredible sponsors and backers",
    "home.sponsors.becomeSupporter": "Become a supporter",
    "home.sponsors.prev": "Previous Sponsors",
    "home.sponsors.next": "Next Sponsors",
    // Showcase page chrome. (The app descriptions themselves stay English for now
    // — the card data set is being made structured + localisable separately.)
    "showcase.title": "Vapor powers thousands of high performing apps and sites",
    "showcase.caption": "Discover the apps, sites and companies building on Vapor - and the teams behind them.",
    "showcase.search": "Search",
    "showcase.searchLabel": "Search showcase",
    "showcase.sortLabel": "Sort showcase",
    "showcase.sort.newest": "Newest first",
    "showcase.sort.oldest": "Oldest first",
    "showcase.sort.nameAsc": "Name (A–Z)",
    "showcase.sort.nameDesc": "Name (Z–A)",
    "showcase.empty": "No apps match your search.",
    "showcase.paginationLabel": "Showcase pagination",
    "showcase.cta.title": "Using Vapor in your app? We'd love to feature you!",
    "showcase.cta.caption": "Help demonstrate all the different ways Vapor can be used.",
    "showcase.cta.button": "Get in touch",
    // Team page. The team-member names, handles, bios and social links are not
    // localised (they live in team.leaf); only the surrounding chrome is.
    "team.header.title": "Meet the team that builds and maintains Vapor",
    "team.header.caption": "Vapor is built and maintained by a small core team with the help of an amazing community of contributors and sponsors.",
    "team.maintainers": "Maintainers",
    "team.contributors": "Contributors",
    // The contributors/backers grids are populated client-side; the fallback text
    // shows only if the GitHub/OpenCollective fetch fails. The link labels
    // (GitHub, OpenCollective) live inline in the template.
    "team.contributors.fallback": "Couldn't load contributors right now — see them all on",
    "team.cta.title": "Want to help us grow? Become a supporter",
    "team.cta.caption": "Vapor is 100% open source and supporter backed. A great way of getting involved is by sponsoring or supporting us monthly.",
    "team.cta.button": "Support Vapor",
    // Prefixed by the live sponsor+backer count (rendered by sponsors.js).
    "team.sponsors.heading": "Sponsors are funding Vapor's work",
    "team.sponsors": "Sponsors",
    "team.backers": "Backers",
    "team.backers.fallback": "Couldn't load backers right now — see them all on",
    "team.and": "and",
]

let englishLanguage = Language(.english, isDefault: true, customStrings: englishStrings, image: "static/images/opengraph/vapor-og-en-2x.png")
