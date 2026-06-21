import Plot
import Publish
import VaporDesign

struct ShowcasePage: Component {
    let context: PublishingContext<MainSite>
    let isDemo: Bool

    init(context: PublishingContext<MainSite>, isDemo: Bool) {
        self.context = context
        self.isDemo = isDemo
    }

    var body: any Component {
        Node.body {
            Node<HTML.BodyContext>.raw(
                "<link rel=\"stylesheet\" href=\""
                    + VaporDesignUtilities.buildResourceLink(
                        for: "/static/css/showcase.css", isLocal: true) + "\">")
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: .main,
                currentMainSitePage: .showcase
            )
            ShowcasePage.Content()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
            Script(
                url: VaporDesignUtilities.buildResourceLink(
                    for: "/static/js/showcase.js", isLocal: true))
        }.id("showcase-page-body").class("main-site-faded-background")
    }
}

extension ShowcasePage {
    struct ShowcaseApp {
        let name: String
        let url: String
        let image: String
        let description: String
    }

    struct Content: Component {
        let isLocal: Bool

        init(isLocal: Bool = false) {
            self.isLocal = isLocal
        }

        var apps: [ShowcaseApp] {
            [
                ShowcaseApp(
                    name: "SwiftFiddle",
                    url: "https://swiftfiddle.com",
                    image: VaporDesignUtilities.buildResourceLink(
                        for: "/images/swiftfiddle-card.png", isLocal: isLocal),
                    description:
                        "SwiftFiddle is an online playground for creating, sharing and embedding Swift fiddles."
                ),
                ShowcaseApp(
                    name: "Underway NYC",
                    url: "https://www.underway.nyc",
                    image: VaporDesignUtilities.buildResourceLink(
                        for: "/images/underway-nyc-card.png", isLocal: isLocal),
                    description:
                        "Quickly locate yourself on the official MTA map of NYC and get real-time train arrivals at that subway stop."
                ),
                ShowcaseApp(
                    name: "Swift Package Index",
                    url: "https://swiftpackageindex.com",
                    image: "/static/images/showcase/swift-package-index.png",
                    description:
                        "The Swift Package Index is a searchable index of Swift packages and their compatibility with various platforms."
                ),
                ShowcaseApp(
                    name: "Litmaps",
                    url: "https://litmaps.com",
                    image: "/static/images/showcase/litmaps.png",
                    description:
                        "Litmaps is a browser-based research platform designed for clarity, comprehensiveness, and collaboration."
                ),
                ShowcaseApp(
                    name: "PassiveLogic",
                    url: "https://passivelogic.com",
                    image: "/static/images/showcase/passive-logic.png",
                    description:
                        "PassiveLogic builds the platform for autonomous building controls, powered by digital twins."
                ),
                ShowcaseApp(
                    name: "TelemetryDeck",
                    url: "https://telemetrydeck.com",
                    image: "/static/images/showcase/telemetry-deck-light.png",
                    description:
                        "TelemetryDeck provides privacy-first, anonymised analytics for apps, backed by a Swift server."
                ),
            ]
        }

        var body: any Component {
            Div {
                buildHeader()
                buildControls()
                buildGrid()
                buildPagination()
                buildCallToAction()
            }.class("container").class("showcase-page")
        }

        func buildHeader() -> Component {
            Div {
                H1("Vapor powers thousands of high performing apps and sites").class("main-title")
                H3(
                    "Discover the apps, sites and companies building on Vapor - and the teams behind them."
                )
                .class("main-page-caption d-flex mx-auto")
            }.class("showcase-page-header")
        }

        func buildControls() -> Component {
            Div {
                Div {
                    Span().class("vapor-icon showcase-search-icon").attribute(
                        named: "aria-hidden", value: "true")
                    Input(type: .text, placeholder: "Search")
                        .id("showcase-search")
                        .class("showcase-search-input")
                        .attribute(named: "aria-label", value: "Search showcase")
                        .attribute(named: "autocomplete", value: "off")
                }.class("showcase-search")
                Div {
                    Node<HTML.BodyContext>.raw(
                        """
                        <select id="showcase-sort" class="showcase-sort-select" aria-label="Sort showcase">
                            <option value="newest">Newest first</option>
                            <option value="oldest">Oldest first</option>
                            <option value="name-asc">Name (A–Z)</option>
                            <option value="name-desc">Name (Z–A)</option>
                        </select>
                        """
                    )
                    Span().class("vapor-icon icon-chevron-down showcase-sort-icon").attribute(
                        named: "aria-hidden", value: "true")
                }.class("showcase-sort")
            }.class("showcase-controls")
        }

        func buildGrid() -> Component {
            ComponentGroup {
                Div {
                    ComponentGroup(
                        members: apps.enumerated().map { index, app in
                            Div {
                                ShowcaseCard(
                                    name: app.name,
                                    url: app.url,
                                    image: app.image,
                                    description: app.description
                                )
                            }
                            .class("showcase-grid-item")
                            .attribute(named: "data-index", value: "\(index)")
                            .attribute(named: "data-name", value: app.name)
                            .attribute(named: "data-description", value: app.description)
                        })
                }.id("showcase-grid").class("showcase-grid")
                Paragraph("No apps match your search.")
                    .id("showcase-empty")
                    .class("showcase-empty d-none")
            }
        }

        func buildPagination() -> Component {
            Navigation {
                List {
                    ComponentGroup(members: [])
                }
                .id("showcase-pagination")
                .class("pagination justify-content-center showcase-pagination d-none")
            }.accessibilityLabel("Showcase pagination")
        }

        func buildCallToAction() -> Component {
            Div {
                H2("Using Vapor in your app? We'd love to feature you!").class("showcase-cta-title")
                Paragraph("Help demonstrate all the different ways Vapor can be used.").class(
                    "showcase-cta-caption")
                Button {
                    Link("Get in touch", url: "https://github.com/vapor/website/issues/new")
                        .linkTarget(.blank)
                }.class("btn btn-primary")
            }.class("showcase-cta")
        }
    }
}
