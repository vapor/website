import Foundation
import Plot
import Publish
import VaporDesign

extension Theme where Site == Homepage {
    static var vaporHomePage: Self {
        Theme(htmlFactory: VaporHomePageThemeHTMLFactory())
    }
}

struct VaporHomePageThemeHTMLFactory: HTMLFactory {
    typealias Site = Homepage

    func makeIndexHTML(
        for index: Index,
        context: PublishingContext<Homepage>
    ) throws -> HTML {
        let isDemo = true
        let body: Node<HTML.DocumentContext> = .body {
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: .main,
                currentMainSitePage: .showcase
            )
            buildMainPage()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
        }

        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: index, context: context, body: body)
    }

    func makeSectionHTML(
        for section: Section<Homepage>,
        context: PublishingContext<Homepage>
    ) throws -> HTML {
        let body: Node<HTML.DocumentContext> = .body {
            let isDemo = true
            let currentSite: CurrentSite = .main
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: currentSite,
                currentMainSitePage: .showcase,
                isDemo: isDemo
            )
            buildMainPage()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: currentSite
            )
        }

        let bodyWithClass = body.class("main-site-main-page")
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: section, context: context, body: bodyWithClass.convertToNode())
    }

    func makeItemHTML(
        for item: Item<Homepage>,
        context: PublishingContext<Homepage>
    ) throws -> HTML {
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: item, context: context, body: .body())
    }

    func makePageHTML(
        for page: Page,
        context: PublishingContext<Homepage>
    ) throws -> HTML {
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: page, context: context, body: .body())
    }

    func makeTagListHTML(
        for page: TagListPage,
        context: PublishingContext<Homepage>
    ) throws -> HTML? {
        nil
    }

    func makeTagDetailsHTML(
        for page: TagDetailsPage,
        context: PublishingContext<Homepage>
    ) throws -> HTML? {
        nil
    }

    func buildMainPage() -> Component {
        Div {
            Span().class("d-flex mx-auto")
                .accessibilityLabel("Vapor Logo")
                .id("vapor-hero-logo")
            H1("Swift, but on a server").class("main-title")
            H3("Vapor provides a safe, performant and easy to use foundation to build HTTP servers, backends and APIs in Swift").class("main-page-caption d-flex mx-auto")

            Div {
                Div {
                    Button {
                        Link("Get Started", url: "https://docs.vapor.codes/").linkTarget(.blank).id("main-page-callout-button-link")
                    }.class("btn btn-primary w-mobile-100")
                }.class("w-mobile-100")
                Div {
                    Button {
                        Link(url: "https://github.com/vapor/vapor") {
                            Span().class("vapor-icon icon-github-line icon-secondary btn-icon me-2")
                            Text("22k stars on GitHub")
                        }.class(" d-flex align-items-center")
                    }.class("btn btn-link btn-secondary-link")
                }.class("d-flex align-items-center ms-lg-5")
            }.class("main-page-callout-buttons d-flex align-items-center justify-content-center flex-column flex-lg-row")

            Div {
                let html = """
                import Vapor

                let app = try Application(.detect())
                defer { app.shutdown() }

                app.get("hello") { req in
                    return "Hello, world!"
                }

                try app.run()











                """
                let code = Node.code(.text(html)).class("language-swift")
                Node.pre(.component(code))
            }.class("main-code-demo mx-auto")

            Div {
                H5("Powering companies like:").class("used-by-caption")
                Div {
                    CompanyCard(name: "Transeo", url: "https://gotranseo.com", logo: "icon-transeo")
                    CompanyCard(name: "John Lewis", url: "https://johnlewis.com", logo: "icon-john-lewis")
                    CompanyCard(name: "Spotify", url: "https://spotify.com", logo: "icon-spotify")
                    CompanyCard(name: "Swift Package Index", url: "https://swiftpackageindex.com", logo: "icon-swift-package-index")
                    CompanyCard(name: "Allegro", url: "https://allegro.pl", logo: "icon-allegro")
                }.class("d-flex flex-row flex-wrap align-items-center justify-content-center used-by-companies-items")
            }.class("used-by-companies")

            Div {
                H2("Build server side with the tooling you already understand").class("main-site-section-header")
                Paragraph {
                    Text("No need to learn a language from scratch (or assemble a different team) just for your backend. Vapor is built on Apple’s SwiftNIO so you’ll get to use the language you already know and love.")
                }.class("caption")

                Div {
                    let vapor = PackageCard(title: "Vapor", description: "Build efficient APIs in a language you love. Create routes, send and receive JSON and build HTTP servers.", icon: "server-04", url: "https://docs.vapor.codes/")
                    let fluent = PackageCard(title: "Fluent", description: "Create models and interact with your database in native, safe Swift code without needing to write any SQL", icon: "database-03", url: "https://docs.vapor.codes/fluent/overview/")
                    let JWT = PackageCard(title: "JWT", description: "Create, sign and verify JSON Web Tokens in Swift. Built on top of SwiftNIO", icon: "key-01", url: "https://docs.vapor.codes/security/jwt/")
                    let leaf = PackageCard(title: "Leaf", description: "A templating engine written in Swift. Generate HTML for both web apps and emails with a simple syntax anyone can use", icon: "code-browser", url: "https://docs.vapor.codes/4.0/leaf/overview/")
                    ComponentGroup(members: [vapor, fluent, JWT, leaf].map { card in
                        Div { card }.class("col")
                    })
                }.class("main-site-packages-grid row row-cols-1 row-cols-lg-2 gx-5")
            }.class("main-site-packages-list")

            Div {
                Div {
                    Div {
                        FeatureContainer(
                            title: "High-performant APIs and servers",
                            description: "Built with a non-blocking, event-driven architecture, Vapor allows you to build high-performant, scalable APIs and HTTP servers. Using Swift's Concurrency model, you can write clear, maintainable code that's efficient and easy to read.",
                            url: "https://docs.vapor.codes/",
                            icon: "icon-dataflow-03"
                        )
                    }.class("col order-2 order-lg-1 g-lg-0").id("performance")
                    Div {
                        Div {
                            let html = """
                            func search (req: Request) async throws -> [Todo] {
                               let searchTerm =
                                 try req.query.get(String.self, at: "term")

                               let results = try await
                               Todo.query(on: req.db)
                                 .filter(\\.$title == searchTerm).all

                               return results
                            }
                            """
                            let code = Node.code(.text(html)).class("language-swift")
                            Node.pre(.component(code))
                        }.class("code-example")
                        Div {}.class("code-outline-right")
                    }.class("col order-1 order-lg-2 g-lg-0 position-relative")
                }.class("row row-cols-1 row-cols-lg-2 align-items-center")
                Div {
                    Div {
                        FeatureContainer(
                            title: "Ship with confidence, even on Fridays",
                            description: "With Vapor's expressive, protocol oriented design, you'll have peace of mind when shipping your code. With our strong type-safety focus, many errors and problems are caught early on by the compiler.",
                            url: "https://docs.vapor.codes/",
                            icon: "icon-brackets-check"
                        )
                    }.class("col order-2 g-lg-0")
                    Div {
                        Div {
                            let html = """
                            func search (req: Request) async throws -> [Todo] {
                               let searchTerm =
                                 try req.query.get(String.self, at: "term")

                               let results = try await
                               Todo.query(on: req.db)
                                 .filter(\\.$number == searchTerm).all()

                               return results
                            }
                            """
                            let code = Node.code(.text(html)).class("language-swift")
                            Node.pre(.component(code))
                        }.class("code-example errored")
                        Div {}.class("code-outline-left")
                        Div {
                            Div {
                                Span().class("vapor-icon icon-alert-octagon")
                            }.class("code-error-sidebar")
                            Span(
                                """
                                Binary operator '==' cannot be applied to operands of type 'KeyPath<Todo,
                                FieldProperty<Todo, Int>>* and 'String'
                                """
                            ).class("code-error-message")
                        }.class("code-error")
                    }.class("col order-1 g-lg-0 position-relative")
                }.class("row row-cols-1 row-cols-lg-2 align-items-center")
            }.class("main-site-features")
            Div {
                Div {
                    Div {
                        Span("Integrations")
                        H2("Full integration with your entire stack")
                        Paragraph {
                            Text("Vapor's mature ecosystem includes over a hundred official and community maintained server-first Swift packages to make building your applications easy and efficient.")
                        }
                        Button {
                            Link(url: "https://docs.vapor.codes/") {
                                Text("Get Started")
                                Span().class("vapor-icon icon-chevron-right")
                            }.linkTarget(.blank)
                        }.class("btn btn-primary w-mobile-100")
                    }.class("code-example-explainer")
                }.class("col order-2 order-lg-1 mt-5 mt-lg-0")
                Div {
                    Image(url: "/images/integrations.png", description: "Vapor Integrations")
                        .class("img-fluid").id("integrations-image")
                }.class("col order-1 order-lg-2")
            }.class("row row-cols-1 row-cols-lg-2 align-items-center").id("integrations")
            Div {
                Div {
                    H3("Used by the teams behind these amazing apps")
                    Button {
                        Link(url: "") {
                            Text("See full list")
                            Span().class("ms-2 vapor-icon icon-chevron-right")
                        }.linkTarget(.blank)
                    }.class("btn btn-primary").class("d-none d-lg-block")
                }.class("showcase-header")
                Div {
                    ShowcaseCard(name: "Sambot", url: "", image: "/images/sambot-card.png", description: "Sambot helps all members of a Mobile App Dev Team to be more productive, reactive and efficient while using Bitrise CI services")
                    ShowcaseCard(name: "Underway NYC", url: "", image: "/images/underway-nyc-card.png", description: "Quickly locate yourself on the official MTA map of NYC and get real-time train arrivals at that subway stop")
                    ShowcaseCard(name: "SwiftFiddle", url: "", image: "/images/swiftfiddle-card.png", description: "SwiftFiddle is an online playground for creating, sharing and embedding Swift fiddles")
                    ShowcaseCard(name: "Transeo", url: "", image: "/images/transeo-card.png", description: "Transeo is an educational readiness platform that helps students determine what they want to do after high school")
                    ShowcaseCard(name: "Sambot", url: "", image: "/images/sambot-card.png", description: "Sambot helps all members of a Mobile App Dev Team to be more productive, reactive and efficient while using Bitrise CI services")
                }.class("showcase-cards scrolling-wrapper").id("showcase-scrolling-wrapper")
                Div {
                    Button {
                        Span().class("vapor-icon icon-arrow-left")
                    }.class("arrow-button").onclick("scrollToLeft()")
                    Button {
                        Span().class("vapor-icon icon-arrow-right")
                    }.class("arrow-button").onclick("scrollToRight()")
                }.class("btn-group")
            }.class("row row-cols-1 row-cols-lg-2").id("showcase")
            Div {
                Div {
                    Image(url: "/images/discord-chat.png", description: "Vapor Discord server")
                        .class("img-fluid").id("discord-chat-image")
                }.class("col")
                Div {
                    Div {
                        Div {
                            H2("Join the largest community of Swift backend developers")
                            Paragraph {
                                Text("Vapor's 13k+ Discord community will be at your side to support you along the way. Ask questions, contribute and be a part of a thriving, wholesome corner of the internet.")
                            }
                            Button {
                                Link(url: "https://docs.vapor.codes/") {
                                    Text("Join our Discord")
                                }.linkTarget(.blank)
                            }.class("btn btn-primary w-mobile-100")
                            Link(url: "https://github.com/vapor/vapor") {
                                Text("Contribute")
                                Span().class("vapor-icon icon-chevron-right")
                            }.class("ms-3 learn-more-link mt-lg-0 mt-3 mb-lg-0 mb-3")
                        }.class("px-4 px-lg-0")
                    }.class("col order-2 order-lg-1 g-lg-0")
                }.class("col")
            }.class("row row-cols-1 row-cols-lg-2").id("discord")

            Div {
                Div {
                    H2("Get all the tools you need to build with Swift").class("d-none d-lg-block")
                    Button {
                        Link(url: "https://docs.vapor.codes/") {
                            Text("Get Started")
                        }.linkTarget(.blank)
                    }.class("btn btn-primary w-mobile-100")
                    Link(url: "https://api.vapor.codes/") {
                        Text("Go to API Docs")
                        Span().class("vapor-icon icon-chevron-right")
                    }.class("ms-3 learn-more-link mt-lg-0 mt-3 mb-lg-0 mb-3").linkTarget(.blank)
                }.class("col order-2 order-lg-1 mt-5 mt-lg-0")
                Div {
                    Div {
                        H2("Get all the tools you need to build with Swift").class("d-lg-none px-4")
                        List {
                            ListItem {
                                Span().class("align-middle vapor-icon icon-check-circle icon-secondary me-2 d-inline-block")
                                Span("Easily create new projects with the Vapor Toolbox").class("align-middle")
                            }
                            ListItem {
                                Span().class("align-middle vapor-icon icon-check-circle icon-secondary me-2 d-inline-block")
                                Span("Expansive documentation and API reference").class("align-middle")
                            }
                            ListItem {
                                Span().class("align-middle vapor-icon icon-check-circle icon-secondary me-2 d-inline-block")
                                Span("Everything you need to build backends and APIs").class("align-middle")
                            }
                            ListItem {
                                Span().class("align-middle vapor-icon icon-check-circle icon-secondary me-2 d-inline-block")
                                Span("Full support for Swift's concurrency model").class("align-middle")
                            }
                        }.class("px-4 p-lg-0")
                    }
                }.class("col items-list order-1 order-lg-2")
            }.class("row row-cols-1 row-cols-lg-2 align-items-center").id("api-docs")
            Div {
                Div {
                    H3("Supported by our incredible sponsors and backers")
                    Link(url: "") {
                        Text("Become a supporter")
                    }.class("btn btn-secondary")
                }.id("sponsors-header")
                Div {
                    SponsorCard(name: "Broken Hands", url: "https://www.brokenhands.io/", logo: "/images/brokenhands.png", description: "Providing Vapor training and consulting for clients around the world.")
                    SponsorCard(name: "omrd", url: "https://omrd.com", logo: "/images/omrd.png", description: "omrd provides consultation services for dental elated scans.")
                    SponsorCard(name: "Transeo", url: "https://gotranseo.com", logo: "/images/transeo.png", description: "Transeo is an educational technology company that builds tracking tools for student planning and data analysis.")
                }.class("sponsors-list")
            }.class("row").id("sponsors")
        }.class("container")
    }
}