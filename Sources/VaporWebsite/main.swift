import Kiln
import VaporDesignTheme

// The Vapor marketing site (vapor.codes), built with Kiln.
//
// The pages are custom HTML in Leaf templates under `Theme/` (a custom theme
// overriding the bundled one); each `Content/*.md` is a thin front-matter stub
// selecting a template (the home page uses `home.leaf`).
//
// Localisation: every `#localise("key")` resolves against a per-language
// `customStrings` dictionary. Each language's strings + its `Language` value live
// in `Translations/<Language>.swift`; English is the default, so any key a
// translation omits falls back to English.

// MARK: - Site

let site = KilnSite(
    name: "Vapor",
    // Canonical host is the www subdomain — apex `vapor.codes` 301-redirects to
    // `www`, so every absolute URL Kiln emits (canonical, og:url, hreflang,
    // sitemap, llms.txt) must use www to avoid pointing at a redirect.
    url: "https://www.vapor.codes",
    description: "A framework for building APIs, backend servers and websites, in Swift.",
    // Default OpenGraph/Twitter preview image (1200×630 @2x). Site-relative, so it
    // resolves to https://vapor.codes/static/images/vapor-og-2x.png. Pages can
    // override per-file via `image:` front matter.
    image: "static/images/opengraph/vapor-og-en-2x.png",
    // Emitted by the shared head as twitter:site / twitter:creator.
    twitterSite: "@codevapor",
    // JSON-LD publisher entity (Organization + WebSite structured data). The same
    // entity is referenced by the docs site so they share one knowledge-graph node.
    organization: .init(
        name: "Vapor",
        url: "https://www.vapor.codes",
        logo: "https://design.vapor.codes/favicons/apple-touch-icon.png",
        sameAs: [
            "https://twitter.com/codevapor",
            "https://hachyderm.io/@codevapor",
            "https://bsky.app/profile/vapor.codes",
            "https://github.com/vapor",
        ]
    ),
    // Rendered by the shared footer (#(site.copyright)).
    copyright: "© QuTheory, LLC 2026",
    theme: .custom(
        directory: "Theme",
        // Shared header/footer/head come from the design package as a theme layer;
        // anything in this site's own Theme/ still overrides them.
        sharedLayers: [VaporDesignTheme.directory],
        palette: .autoLightDark(primary: .black, accent: .blue)
    ),
    languages: [
        englishLanguage,
        germanLanguage,
        spanishLanguage,
        frenchLanguage,
        italianLanguage,
        japaneseLanguage,
        koreanLanguage,
        dutchLanguage,
        polishLanguage,
        chineseLanguage,
        brazilianPortugueseLanguage,
        arabicLanguage,
    ],
    // This site localises via customStrings/templates, not per-locale content
    // files — so Kiln's "fallback" pages are in fact fully translated. Keep them
    // indexable instead of noindex.
    indexFallbackPages: true
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
try await Kiln.build(site, contentDirectory: contentDirectory, outputDirectory: outputDirectory, leafTags: VaporDesignTheme.leafTags)
print("Done.")
