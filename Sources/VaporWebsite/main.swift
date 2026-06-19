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
    // `{count}` is filled in by updateStarsCount.js with the live GitHub star count.
    "home.hero.stars": "{count} stars on GitHub",
    "home.hero.starsLoading": "… stars on GitHub",
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
    "home.hero.stars": "{count} Sterne auf GitHub",
    "home.hero.starsLoading": "… Sterne auf GitHub",
    "home.companies.caption": "Im Einsatz bei Unternehmen wie:",
    "home.packages.title": "Entwickle serverseitig mit den Werkzeugen, die du bereits kennst",
    "home.packages.caption": "Du musst keine Sprache von Grund auf neu lernen (oder ein eigenes Team aufbauen) nur für dein Backend. Vapor baut auf Apples SwiftNIO auf, sodass du die Sprache verwenden kannst, die du bereits kennst und liebst.",
    "home.showcase.title": "Verwendet von den Teams hinter diesen großartigen Apps",
    "home.discord.title": "Tritt der größten Community von Swift-Backend-Entwicklern bei",
    "home.sponsors.title": "Unterstützt von unseren großartigen Sponsoren und Förderern",
    "home.sponsors.becomeSupporter": "Werde Unterstützer",
    "home.apiDocs.goToApiDocs": "Zur API-Dokumentation",
    "home.discord.contribute": "Mitwirken",
    "home.showcase.seeFullList": "Vollständige Liste ansehen",
    "home.showcase.prev": "Vorheriges Showcase",
    "home.showcase.next": "Nächstes Showcase",
    "home.sponsors.prev": "Vorherige Sponsoren",
    "home.sponsors.next": "Nächste Sponsoren",
]

// Remaining languages — translated incrementally. Any key a language omits falls
// back to the English string above. Best-effort translations; native-speaker
// review welcome.
let spanishStrings: [String: String] = [
    "home.hero.title": "Swift, pero en el servidor",
    "home.hero.caption": "Vapor proporciona una base segura, eficiente y fácil de usar para crear servidores HTTP, backends y APIs en Swift",
    // Buttons / controls.
    "cta.getStarted": "Comenzar",
    "cta.learnMore": "Más información",
    "cta.seeInAction": "Míralo en acción",
    "home.apiDocs.goToApiDocs": "Ir a la documentación de la API",
    "home.discord.contribute": "Contribuir",
    "home.showcase.seeFullList": "Ver lista completa",
    "home.showcase.prev": "Showcase anterior",
    "home.showcase.next": "Showcase siguiente",
    "home.sponsors.becomeSupporter": "Conviértete en patrocinador",
    "home.sponsors.prev": "Patrocinadores anteriores",
    "home.sponsors.next": "Patrocinadores siguientes",
    "footer.joinDiscord": "Únete a nuestro Discord",
    // Nav / footer chrome.
    "nav.documentation": "Documentación",
    "nav.frameworkDocs": "Documentación del framework",
    "nav.frameworkDocs.caption": "Aprende a usar Vapor",
    "nav.apiDocs": "Documentación de la API",
    "nav.apiDocs.caption": "Documentación de referencia de Vapor",
    "nav.selectTheme": "Seleccionar tema",
    "nav.closeMenu": "Cerrar el menú",
    "footer.supporters": "Colaboradores",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} estrellas en GitHub",
    "home.hero.starsLoading": "… estrellas en GitHub",
    "home.companies.caption": "Impulsando a empresas como:",
    "home.packages.title": "Desarrolla el lado del servidor con las herramientas que ya conoces",
    "home.packages.caption": "No necesitas aprender un lenguaje desde cero (ni formar un equipo distinto) solo para tu backend. Vapor está construido sobre SwiftNIO de Apple, así que podrás usar el lenguaje que ya conoces y adoras.",
]
let frenchStrings: [String: String] = [
    "home.hero.title": "Swift, mais sur le serveur",
    "home.hero.caption": "Vapor fournit une base sûre, performante et facile à utiliser pour créer des serveurs HTTP, des backends et des API en Swift",
    // Buttons / controls.
    "cta.getStarted": "Commencer",
    "cta.learnMore": "En savoir plus",
    "cta.seeInAction": "Voir en action",
    "home.apiDocs.goToApiDocs": "Accéder à la documentation de l’API",
    "home.discord.contribute": "Contribuer",
    "home.showcase.seeFullList": "Voir la liste complète",
    "home.showcase.prev": "Vitrine précédente",
    "home.showcase.next": "Vitrine suivante",
    "home.sponsors.becomeSupporter": "Devenir soutien",
    "home.sponsors.prev": "Sponsors précédents",
    "home.sponsors.next": "Sponsors suivants",
    "footer.joinDiscord": "Rejoignez notre Discord",
    // Nav / footer chrome.
    "nav.documentation": "Documentation",
    "nav.frameworkDocs": "Documentation du framework",
    "nav.frameworkDocs.caption": "Apprenez à utiliser Vapor",
    "nav.apiDocs": "Documentation de l’API",
    "nav.apiDocs.caption": "Documentation de référence de Vapor",
    "nav.selectTheme": "Sélectionner le thème",
    "nav.closeMenu": "Fermer le menu",
    "footer.supporters": "Soutiens",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} étoiles sur GitHub",
    "home.hero.starsLoading": "… étoiles sur GitHub",
    "home.companies.caption": "Utilisé par des entreprises comme :",
    "home.packages.title": "Développez côté serveur avec les outils que vous maîtrisez déjà",
    "home.packages.caption": "Pas besoin d’apprendre un langage à partir de zéro (ni de constituer une autre équipe) juste pour votre backend. Vapor repose sur SwiftNIO d’Apple, vous pourrez donc utiliser le langage que vous connaissez et appréciez déjà.",
]
let italianStrings: [String: String] = [
    "home.hero.title": "Swift, ma sul server",
    "home.hero.caption": "Vapor offre una base sicura, performante e facile da usare per creare server HTTP, backend e API in Swift",
    // Buttons / controls.
    "cta.getStarted": "Inizia",
    "cta.learnMore": "Scopri di più",
    "cta.seeInAction": "Guardalo in azione",
    "home.apiDocs.goToApiDocs": "Vai alla documentazione API",
    "home.discord.contribute": "Contribuisci",
    "home.showcase.seeFullList": "Vedi l’elenco completo",
    "home.showcase.prev": "Showcase precedente",
    "home.showcase.next": "Showcase successivo",
    "home.sponsors.becomeSupporter": "Diventa sostenitore",
    "home.sponsors.prev": "Sponsor precedenti",
    "home.sponsors.next": "Sponsor successivi",
    "footer.joinDiscord": "Unisciti al nostro Discord",
    // Nav / footer chrome.
    "nav.documentation": "Documentazione",
    "nav.frameworkDocs": "Documentazione del Framework",
    "nav.frameworkDocs.caption": "Impara a usare Vapor",
    "nav.apiDocs": "Documentazione API",
    "nav.apiDocs.caption": "Documentazione di riferimento per Vapor",
    "nav.selectTheme": "Seleziona il tema",
    "nav.closeMenu": "Chiudi il menu",
    "footer.supporters": "Sostenitori",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} stelle su GitHub",
    "home.hero.starsLoading": "… stelle su GitHub",
    "home.companies.caption": "Al servizio di aziende come:",
    "home.packages.title": "Sviluppa lato server con gli strumenti che già conosci",
    "home.packages.caption": "Non c’è bisogno di imparare un linguaggio da zero (o di mettere insieme un altro team) solo per il tuo backend. Vapor è costruito su SwiftNIO di Apple, così potrai usare il linguaggio che già conosci e ami.",
]
let japaneseStrings: [String: String] = [
    "home.hero.title": "Swift、ただしサーバー上で",
    "home.hero.caption": "Vaporは、SwiftでHTTPサーバー、バックエンド、APIを構築するための安全で高性能、かつ使いやすい基盤を提供します",
    // Buttons / controls.
    "cta.getStarted": "始める",
    "cta.learnMore": "詳しく見る",
    "cta.seeInAction": "実際の動作を見る",
    "home.apiDocs.goToApiDocs": "APIドキュメントへ",
    "home.discord.contribute": "貢献する",
    "home.showcase.seeFullList": "一覧を見る",
    "home.showcase.prev": "前のショーケース",
    "home.showcase.next": "次のショーケース",
    "home.sponsors.becomeSupporter": "サポーターになる",
    "home.sponsors.prev": "前のスポンサー",
    "home.sponsors.next": "次のスポンサー",
    "footer.joinDiscord": "Discordに参加する",
    // Nav / footer chrome.
    "nav.documentation": "ドキュメント",
    "nav.frameworkDocs": "フレームワークドキュメント",
    "nav.frameworkDocs.caption": "Vaporの使い方を学ぶ",
    "nav.apiDocs": "APIドキュメント",
    "nav.apiDocs.caption": "Vaporのリファレンスドキュメント",
    "nav.selectTheme": "テーマを選択",
    "nav.closeMenu": "メニューを閉じる",
    "footer.supporters": "サポーター",
    // Home — stars / companies / packages.
    "home.hero.stars": "GitHubで{count}個のスター",
    "home.hero.starsLoading": "GitHubで…個のスター",
    "home.companies.caption": "次のような企業で利用されています:",
    "home.packages.title": "すでに慣れ親しんだツールでサーバーサイドを構築",
    "home.packages.caption": "バックエンドのためだけに、言語をゼロから学んだり（別のチームを編成したり）する必要はありません。VaporはAppleのSwiftNIO上に構築されているため、すでに知っていて愛用している言語をそのまま使えます。",
]
let koreanStrings: [String: String] = [
    "home.hero.title": "Swift, 하지만 서버에서",
    "home.hero.caption": "Vapor는 Swift로 HTTP 서버, 백엔드 및 API를 구축할 수 있는 안전하고 성능이 뛰어나며 사용하기 쉬운 기반을 제공합니다",
    // Buttons / controls.
    "cta.getStarted": "시작하기",
    "cta.learnMore": "자세히 보기",
    "cta.seeInAction": "직접 확인하기",
    "home.apiDocs.goToApiDocs": "API 문서로 이동",
    "home.discord.contribute": "기여하기",
    "home.showcase.seeFullList": "전체 목록 보기",
    "home.showcase.prev": "이전 쇼케이스",
    "home.showcase.next": "다음 쇼케이스",
    "home.sponsors.becomeSupporter": "후원자 되기",
    "home.sponsors.prev": "이전 후원자",
    "home.sponsors.next": "다음 후원자",
    "footer.joinDiscord": "Discord에 참여하기",
    // Nav / footer chrome.
    "nav.documentation": "문서",
    "nav.frameworkDocs": "프레임워크 문서",
    "nav.frameworkDocs.caption": "Vapor 사용법 알아보기",
    "nav.apiDocs": "API 문서",
    "nav.apiDocs.caption": "Vapor 레퍼런스 문서",
    "nav.selectTheme": "테마 선택",
    "nav.closeMenu": "메뉴 닫기",
    "footer.supporters": "후원자",
    // Home — stars / companies / packages.
    "home.hero.stars": "GitHub에서 {count}개의 스타",
    "home.hero.starsLoading": "GitHub에서 …개의 스타",
    "home.companies.caption": "다음과 같은 기업들이 사용합니다:",
    "home.packages.title": "이미 알고 있는 도구로 서버 사이드를 구축하세요",
    "home.packages.caption": "백엔드만을 위해 언어를 처음부터 배우거나 별도의 팀을 꾸릴 필요가 없습니다. Vapor는 Apple의 SwiftNIO를 기반으로 만들어져, 이미 알고 좋아하는 언어를 그대로 사용할 수 있습니다.",
]
let dutchStrings: [String: String] = [
    "home.hero.title": "Swift, maar dan op een server",
    "home.hero.caption": "Vapor biedt een veilige, performante en gebruiksvriendelijke basis om HTTP-servers, backends en API's in Swift te bouwen",
    // Buttons / controls.
    "cta.getStarted": "Aan de slag",
    "cta.learnMore": "Meer informatie",
    "cta.seeInAction": "Zie het in actie",
    "home.apiDocs.goToApiDocs": "Naar de API-documentatie",
    "home.discord.contribute": "Bijdragen",
    "home.showcase.seeFullList": "Volledige lijst bekijken",
    "home.showcase.prev": "Vorige showcase",
    "home.showcase.next": "Volgende showcase",
    "home.sponsors.becomeSupporter": "Word ondersteuner",
    "home.sponsors.prev": "Vorige sponsors",
    "home.sponsors.next": "Volgende sponsors",
    "footer.joinDiscord": "Word lid van onze Discord",
    // Nav / footer chrome.
    "nav.documentation": "Documentatie",
    "nav.frameworkDocs": "Framework-documentatie",
    "nav.frameworkDocs.caption": "Leer hoe je Vapor gebruikt",
    "nav.apiDocs": "API-documentatie",
    "nav.apiDocs.caption": "Referentiedocumentatie voor Vapor",
    "nav.selectTheme": "Selecteer thema",
    "nav.closeMenu": "Menu sluiten",
    "footer.supporters": "Ondersteuners",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} sterren op GitHub",
    "home.hero.starsLoading": "… sterren op GitHub",
    "home.companies.caption": "Drijft bedrijven aan zoals:",
    "home.packages.title": "Bouw server-side met de tools die je al kent",
    "home.packages.caption": "Je hoeft geen taal vanaf nul te leren (of een apart team samen te stellen) alleen voor je backend. Vapor is gebouwd op Apple’s SwiftNIO, dus je kunt de taal gebruiken die je al kent en waardeert.",
]
let polishStrings: [String: String] = [
    "home.hero.title": "Swift, ale na serwerze",
    "home.hero.caption": "Vapor zapewnia bezpieczną, wydajną i łatwą w użyciu podstawę do tworzenia serwerów HTTP, backendów i interfejsów API w Swift",
    // Buttons / controls.
    "cta.getStarted": "Rozpocznij",
    "cta.learnMore": "Dowiedz się więcej",
    "cta.seeInAction": "Zobacz w działaniu",
    "home.apiDocs.goToApiDocs": "Przejdź do dokumentacji API",
    "home.discord.contribute": "Współtwórz",
    "home.showcase.seeFullList": "Zobacz pełną listę",
    "home.showcase.prev": "Poprzedni showcase",
    "home.showcase.next": "Następny showcase",
    "home.sponsors.becomeSupporter": "Zostań sponsorem",
    "home.sponsors.prev": "Poprzedni sponsorzy",
    "home.sponsors.next": "Następni sponsorzy",
    "footer.joinDiscord": "Dołącz do naszego Discorda",
    // Nav / footer chrome.
    "nav.documentation": "Dokumentacja",
    "nav.frameworkDocs": "Dokumentacja frameworka",
    "nav.frameworkDocs.caption": "Naucz się korzystać z Vapor",
    "nav.apiDocs": "Dokumentacja API",
    "nav.apiDocs.caption": "Dokumentacja referencyjna Vapor",
    "nav.selectTheme": "Wybierz motyw",
    "nav.closeMenu": "Zamknij menu",
    "footer.supporters": "Wspierający",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} gwiazdek na GitHub",
    "home.hero.starsLoading": "… gwiazdek na GitHub",
    "home.companies.caption": "Napędza firmy takie jak:",
    "home.packages.title": "Twórz po stronie serwera za pomocą narzędzi, które już znasz",
    "home.packages.caption": "Nie musisz uczyć się języka od zera (ani budować osobnego zespołu) tylko dla swojego backendu. Vapor jest zbudowany na bazie SwiftNIO firmy Apple, więc możesz używać języka, który już znasz i lubisz.",
]
let chineseStrings: [String: String] = [
    "home.hero.title": "Swift，但在服务器上",
    "home.hero.caption": "Vapor 提供了一个安全、高性能且易于使用的基础，用于在 Swift 中构建 HTTP 服务器、后端和 API",
    // Buttons / controls.
    "cta.getStarted": "开始使用",
    "cta.learnMore": "了解更多",
    "cta.seeInAction": "查看实际效果",
    "home.apiDocs.goToApiDocs": "前往 API 文档",
    "home.discord.contribute": "参与贡献",
    "home.showcase.seeFullList": "查看完整列表",
    "home.showcase.prev": "上一个展示",
    "home.showcase.next": "下一个展示",
    "home.sponsors.becomeSupporter": "成为赞助者",
    "home.sponsors.prev": "上一批赞助者",
    "home.sponsors.next": "下一批赞助者",
    "footer.joinDiscord": "加入我们的 Discord",
    // Nav / footer chrome.
    "nav.documentation": "文档",
    "nav.frameworkDocs": "框架文档",
    "nav.frameworkDocs.caption": "学习如何使用 Vapor",
    "nav.apiDocs": "API 文档",
    "nav.apiDocs.caption": "Vapor 参考文档",
    "nav.selectTheme": "选择主题",
    "nav.closeMenu": "关闭菜单",
    "footer.supporters": "赞助者",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} 个 GitHub star",
    "home.hero.starsLoading": "… 个 GitHub star",
    "home.companies.caption": "为以下公司提供支持：",
    "home.packages.title": "使用你已熟悉的工具构建服务器端",
    "home.packages.caption": "无需仅仅为了后端而从头学习一门语言（或组建另一支团队）。Vapor 基于 Apple 的 SwiftNIO 构建，因此你可以继续使用你已经熟悉和喜爱的语言。",
]
let brazilianPortugueseStrings: [String: String] = [
    "home.hero.title": "Swift, mas no servidor",
    "home.hero.caption": "O Vapor oferece uma base segura, eficiente e fácil de usar para criar servidores HTTP, backends e APIs em Swift",
    // Buttons / controls.
    "cta.getStarted": "Começar",
    "cta.learnMore": "Saiba mais",
    "cta.seeInAction": "Veja em ação",
    "home.apiDocs.goToApiDocs": "Ir para a documentação da API",
    "home.discord.contribute": "Contribuir",
    "home.showcase.seeFullList": "Ver lista completa",
    "home.showcase.prev": "Showcase anterior",
    "home.showcase.next": "Próximo showcase",
    "home.sponsors.becomeSupporter": "Torne-se um apoiador",
    "home.sponsors.prev": "Patrocinadores anteriores",
    "home.sponsors.next": "Próximos patrocinadores",
    "footer.joinDiscord": "Entre no nosso Discord",
    // Nav / footer chrome.
    "nav.documentation": "Documentação",
    "nav.frameworkDocs": "Documentação do framework",
    "nav.frameworkDocs.caption": "Aprenda a usar o Vapor",
    "nav.apiDocs": "Documentação da API",
    "nav.apiDocs.caption": "Documentação de referência do Vapor",
    "nav.selectTheme": "Selecionar tema",
    "nav.closeMenu": "Fechar menu",
    "footer.supporters": "Apoiadores",
    // Home — stars / companies / packages.
    "home.hero.stars": "{count} estrelas no GitHub",
    "home.hero.starsLoading": "… estrelas no GitHub",
    "home.companies.caption": "Impulsionando empresas como:",
    "home.packages.title": "Crie o lado do servidor com as ferramentas que você já conhece",
    "home.packages.caption": "Não é preciso aprender uma linguagem do zero (nem montar uma equipe separada) só para o seu backend. O Vapor é construído sobre o SwiftNIO da Apple, então você poderá usar a linguagem que você já conhece e ama.",
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
                toggleNavigation: "Navigation umschalten",
                home: "Startseite",
                store: "Shop",
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
        .init(
            .spanish,
            customStrings: spanishStrings,
            localisation: .init(
                notFoundTitle: "Página no encontrada",
                notFoundMessage: "Es posible que la página que buscas se haya movido, cambiado de nombre o que nunca haya existido.",
                notFoundLink: "Volver a la página de inicio",
                toggleNavigation: "Alternar la navegación",
                home: "Inicio",
                store: "Tienda",
                blog: "Blog",
                showcase: "Proyectos",
                team: "Equipo",
                help: "Ayuda",
                pressKit: "Kit de prensa",
                community: "Comunidad",
                resources: "Recursos",
                language: "Idioma",
                theme: "Tema",
                lightTheme: "Claro",
                darkTheme: "Oscuro",
                systemTheme: "Sistema"
            )
        ),
        .init(
            .french,
            customStrings: frenchStrings,
            localisation: .init(
                notFoundTitle: "Page introuvable",
                notFoundMessage: "La page que vous recherchez a peut-être été déplacée, renommée ou n’a jamais existé.",
                notFoundLink: "Retour à la page d’accueil",
                toggleNavigation: "Afficher/masquer la navigation",
                home: "Accueil",
                store: "Boutique",
                blog: "Blog",
                showcase: "Vitrine",
                team: "Équipe",
                help: "Aide",
                pressKit: "Kit de presse",
                community: "Communauté",
                resources: "Ressources",
                language: "Langue",
                theme: "Thème",
                lightTheme: "Clair",
                darkTheme: "Sombre",
                systemTheme: "Système"
            )
        ),
        .init(
            .italian,
            customStrings: italianStrings,
            localisation: .init(
                notFoundTitle: "Pagina non trovata",
                notFoundMessage: "La pagina che stai cercando potrebbe essere stata spostata, rinominata o non essere mai esistita.",
                notFoundLink: "Torna alla home page",
                toggleNavigation: "Attiva/disattiva la navigazione",
                home: "Home",
                store: "Shop",
                blog: "Blog",
                showcase: "Vetrina",
                team: "Team",
                help: "Aiuto",
                pressKit: "Kit stampa",
                community: "Community",
                resources: "Risorse",
                language: "Lingua",
                theme: "Tema",
                lightTheme: "Chiaro",
                darkTheme: "Scuro",
                systemTheme: "Sistema"
            )
        ),
        .init(
            .japanese,
            customStrings: japaneseStrings,
            localisation: .init(
                notFoundTitle: "ページが見つかりません",
                notFoundMessage: "お探しのページは移動または名称変更されたか、存在しない可能性があります。",
                notFoundLink: "ホームページに戻る",
                toggleNavigation: "ナビゲーションの切り替え",
                home: "ホーム",
                store: "ストア",
                blog: "ブログ",
                showcase: "ショーケース",
                team: "チーム",
                help: "ヘルプ",
                pressKit: "プレスキット",
                community: "コミュニティ",
                resources: "リソース",
                language: "言語",
                theme: "テーマ",
                lightTheme: "ライト",
                darkTheme: "ダーク",
                systemTheme: "システム"
            )
        ),
        .init(
            .korean,
            customStrings: koreanStrings,
            localisation: .init(
                notFoundTitle: "페이지를 찾을 수 없습니다",
                notFoundMessage: "찾고 있는 페이지가 이동되었거나 이름이 변경되었거나 존재하지 않을 수 있습니다.",
                notFoundLink: "홈페이지로 돌아가기",
                toggleNavigation: "내비게이션 전환",
                home: "홈",
                store: "스토어",
                blog: "블로그",
                showcase: "쇼케이스",
                team: "팀",
                help: "도움말",
                pressKit: "프레스 킷",
                community: "커뮤니티",
                resources: "리소스",
                language: "언어",
                theme: "테마",
                lightTheme: "라이트",
                darkTheme: "다크",
                systemTheme: "시스템"
            )
        ),
        .init(
            .dutch,
            customStrings: dutchStrings,
            localisation: .init(
                notFoundTitle: "Pagina niet gevonden",
                notFoundMessage: "De pagina die je zoekt is mogelijk verplaatst, hernoemd of heeft nooit bestaan.",
                notFoundLink: "Terug naar de startpagina",
                toggleNavigation: "Navigatie schakelen",
                home: "Home",
                store: "Winkel",
                blog: "Blog",
                showcase: "Etalage",
                team: "Team",
                help: "Help",
                pressKit: "Perskit",
                community: "Community",
                resources: "Bronnen",
                language: "Taal",
                theme: "Thema",
                lightTheme: "Licht",
                darkTheme: "Donker",
                systemTheme: "Systeem"
            )
        ),
        .init(
            .polish,
            customStrings: polishStrings,
            localisation: .init(
                notFoundTitle: "Nie znaleziono strony",
                notFoundMessage: "Strona, której szukasz, mogła zostać przeniesiona, zmieniona lub nigdy nie istniała.",
                notFoundLink: "Powrót do strony głównej",
                toggleNavigation: "Przełącz nawigację",
                home: "Strona główna",
                store: "Sklep",
                blog: "Blog",
                showcase: "Realizacje",
                team: "Zespół",
                help: "Pomoc",
                pressKit: "Materiały prasowe",
                community: "Społeczność",
                resources: "Zasoby",
                language: "Język",
                theme: "Motyw",
                lightTheme: "Jasny",
                darkTheme: "Ciemny",
                systemTheme: "Systemowy"
            )
        ),
        .init(
            .chinese,
            customStrings: chineseStrings,
            localisation: .init(
                notFoundTitle: "未找到页面",
                notFoundMessage: "您要查找的页面可能已被移动、重命名或从未存在。",
                notFoundLink: "返回首页",
                toggleNavigation: "切换导航",
                home: "首页",
                store: "商店",
                blog: "博客",
                showcase: "案例展示",
                team: "团队",
                help: "帮助",
                pressKit: "媒体资源",
                community: "社区",
                resources: "资源",
                language: "语言",
                theme: "主题",
                lightTheme: "浅色",
                darkTheme: "深色",
                systemTheme: "跟随系统"
            )
        ),
        .init(
            .brazilianPortuguese,
            customStrings: brazilianPortugueseStrings,
            localisation: .init(
                notFoundTitle: "Página não encontrada",
                notFoundMessage: "A página que você procura pode ter sido movida, renomeada ou nunca ter existido.",
                notFoundLink: "Voltar para a página inicial",
                toggleNavigation: "Alternar navegação",
                home: "Início",
                store: "Loja",
                blog: "Blog",
                showcase: "Vitrine",
                team: "Equipe",
                help: "Ajuda",
                pressKit: "Kit de imprensa",
                community: "Comunidade",
                resources: "Recursos",
                language: "Idioma",
                theme: "Tema",
                lightTheme: "Claro",
                darkTheme: "Escuro",
                systemTheme: "Sistema"
            )
        ),
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
