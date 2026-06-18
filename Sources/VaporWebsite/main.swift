import Kiln

// The Vapor marketing site (vapor.codes), built with Kiln.
//
// Unlike the docs site, these pages are custom-HTML rather than prose, so the
// markup lives in Leaf templates under `Theme/` (a custom theme that fully
// overrides the bundled one). Each content file is a thin front-matter stub that
// selects a template; the home page (`index.md`, isHome) uses `home.leaf`.
//
// Localisation: all visible copy is either a built-in chrome string (`strings.*`)
// or a theme-defined `#localise("key")` looked up in `customStrings`. English is
// the default language, so its `customStrings` below double as the fallback for
// any key a translation omits. No per-language `.md` files are needed — the
// `/de/` pages are built from the same templates with the German strings.

// MARK: - Theme strings (English = default + fallback)

// Every `#localise("…")` key used in the templates must appear here, or the raw
// key would render. These are the exact English strings, so the English build is
// byte-for-byte the old Publish output.
let englishStrings: [String: String] = [
    // Navigation / footer chrome not covered by the built-in `strings.*` set.
    "nav.closeMenu": "Close menu",
    "nav.documentation": "Documentation",
    "nav.frameworkDocs": "Framework Docs",
    "nav.frameworkDocs.caption": "Learn how to use Vapor",
    "nav.apiDocs": "API Docs",
    "nav.apiDocs.caption": "Reference documentation for Vapor",
    "nav.selectTheme": "Select theme",
    "footer.joinDiscord": "Join our Discord",
    "footer.supporters": "Supporters",
    "comingSoon.message": "This page is still under construction, stay tuned for updates!",
    // Calls to action (shared across sections).
    "cta.getStarted": "Get Started",
    "cta.learnMore": "Learn More",
    "cta.seeInAction": "See it in action",
    // Home — hero.
    "home.hero.title": "Swift, but on a server",
    "home.hero.caption": "Vapor provides a safe, performant and easy to use foundation to build HTTP servers, backends and APIs in Swift",
    // Home — companies.
    "home.companies.caption": "Powering companies like:",
    // Home — packages.
    "home.packages.title": "Build server side with the tooling you already understand",
    "home.packages.caption": "No need to learn a language from scratch (or assemble a different team) just for your backend. Vapor is built on Apple’s SwiftNIO so you’ll get to use the language you already know and love.",
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
]

// German translations (best-effort — native-speaker review welcome). Any key not
// listed here falls back to the English string above, so the build never shows a
// raw key. Card/showcase/sponsor copy is intentionally left to fall back for now
// (that content is being made structured + localisable separately).
let germanStrings: [String: String] = [
    "nav.closeMenu": "Menü schließen",
    "nav.documentation": "Dokumentation",
    "nav.frameworkDocs": "Framework-Dokumentation",
    "nav.frameworkDocs.caption": "Erfahren Sie, wie Sie Vapor verwenden",
    "nav.apiDocs": "API-Dokumentation",
    "nav.apiDocs.caption": "Referenzdokumentation für Vapor",
    "nav.selectTheme": "Thema auswählen",
    "footer.joinDiscord": "Tritt unserem Discord bei",
    "footer.supporters": "Unterstützer",
    "comingSoon.message": "Diese Seite befindet sich noch im Aufbau – bleib dran für Updates!",
    "cta.getStarted": "Loslegen",
    "cta.learnMore": "Mehr erfahren",
    "cta.seeInAction": "In Aktion sehen",
    "home.hero.title": "Swift, aber auf dem Server",
    "home.hero.caption": "Vapor bietet eine sichere, performante und einfach zu bedienende Grundlage, um HTTP-Server, Backends und APIs in Swift zu erstellen",
    "home.companies.caption": "Im Einsatz bei Unternehmen wie:",
    "home.packages.title": "Entwickle serverseitig mit den Werkzeugen, die du bereits kennst",
    "home.showcase.title": "Verwendet von den Teams hinter diesen großartigen Apps",
    "home.discord.title": "Tritt der größten Community von Swift-Backend-Entwicklern bei",
    "home.sponsors.title": "Unterstützt von unseren großartigen Sponsoren und Förderern",
    "home.sponsors.becomeSupporter": "Werde Unterstützer",
]

// Remaining languages — translated incrementally. Any key a language omits falls
// back to the English string above. Best-effort translations; native-speaker
// review welcome.
let spanishStrings: [String: String] = [
    "home.hero.title": "Swift, pero en el servidor",
    "home.hero.caption": "Vapor proporciona una base segura, eficiente y fácil de usar para crear servidores HTTP, backends y APIs en Swift",
]
let frenchStrings: [String: String] = [
    "home.hero.title": "Swift, mais sur le serveur",
    "home.hero.caption": "Vapor fournit une base sûre, performante et facile à utiliser pour créer des serveurs HTTP, des backends et des API en Swift",
]
let italianStrings: [String: String] = [
    "home.hero.title": "Swift, ma sul server",
    "home.hero.caption": "Vapor offre una base sicura, performante e facile da usare per creare server HTTP, backend e API in Swift",
]
let japaneseStrings: [String: String] = [
    "home.hero.title": "Swift、ただしサーバー上で",
    "home.hero.caption": "Vaporは、SwiftでHTTPサーバー、バックエンド、APIを構築するための安全で高性能、かつ使いやすい基盤を提供します",
]
let koreanStrings: [String: String] = [
    "home.hero.title": "Swift, 하지만 서버에서",
    "home.hero.caption": "Vapor는 Swift로 HTTP 서버, 백엔드 및 API를 구축할 수 있는 안전하고 성능이 뛰어나며 사용하기 쉬운 기반을 제공합니다",
]
let dutchStrings: [String: String] = [
    "home.hero.title": "Swift, maar dan op een server",
    "home.hero.caption": "Vapor biedt een veilige, performante en gebruiksvriendelijke basis om HTTP-servers, backends en API's in Swift te bouwen",
]
let polishStrings: [String: String] = [
    "home.hero.title": "Swift, ale na serwerze",
    "home.hero.caption": "Vapor zapewnia bezpieczną, wydajną i łatwą w użyciu podstawę do tworzenia serwerów HTTP, backendów i interfejsów API w Swift",
]
let chineseStrings: [String: String] = [
    "home.hero.title": "Swift，但在服务器上",
    "home.hero.caption": "Vapor 提供了一个安全、高性能且易于使用的基础，用于在 Swift 中构建 HTTP 服务器、后端和 API",
]
let brazilianPortugueseStrings: [String: String] = [
    "home.hero.title": "Swift, mas no servidor",
    "home.hero.caption": "O Vapor oferece uma base segura, eficiente e fácil de usar para criar servidores HTTP, backends e APIs em Swift",
]

// MARK: - Site

let site = KilnSite(
    name: "Vapor",
    url: "https://vapor.codes",
    description: "A framework for building APIs, backend servers and websites, in Swift.",
    theme: .custom(
        directory: "Theme",
        palette: .autoLightDark(primary: .black, accent: .blue)
    ),
    languages: [
        .init(.english, isDefault: true, customStrings: englishStrings),
        .init(
            .german,
            customStrings: germanStrings,
            localisation: .init(
                notFoundTitle: "Seite nicht gefunden",
                notFoundMessage: "Die gesuchte Seite wurde möglicherweise verschoben, umbenannt oder existiert nicht.",
                notFoundLink: "Zurück zur Startseite",
                home: "Startseite",
                blog: "Blog",
                showcase: "Showcase",
                team: "Team",
                help: "Hilfe",
                pressKit: "Pressekit",
                community: "Community",
                resources: "Ressourcen",
                language: "Sprache",
                theme: "Thema",
                lightTheme: "Hell",
                darkTheme: "Dunkel",
                systemTheme: "System"
            )
        ),
        // Remaining languages (the docs' set plus Brazilian Portuguese). Being
        // translated incrementally — keys not yet provided fall back to English,
        // so the `/<locale>/` pages build now with English copy where untranslated.
        .init(.spanish, customStrings: spanishStrings),
        .init(.french, customStrings: frenchStrings),
        .init(.italian, customStrings: italianStrings),
        .init(.japanese, customStrings: japaneseStrings),
        .init(.korean, customStrings: koreanStrings),
        .init(.dutch, customStrings: dutchStrings),
        .init(.polish, customStrings: polishStrings),
        .init(.chinese, customStrings: chineseStrings),
        .init(.brazilianPortuguese, customStrings: brazilianPortugueseStrings),
    ]
) {
    Page("Home", "index.md")
    Page("Showcase", "showcase.md")
    Page("Team", "team.md")
    Page("Supporters", "supporters.md")
    Page("Evangelists", "evangelists.md")
}

let contentDirectory = "Content"
// Kiln's default output directory — what `kiln serve` serves and what the deploy
// uploads to S3 (matches the docs site).
let outputDirectory = "site"

print("Building site into ./\(outputDirectory) …")
try await Kiln.build(site, contentDirectory: contentDirectory, outputDirectory: outputDirectory)
print("Done.")
