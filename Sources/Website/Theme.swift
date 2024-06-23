import Foundation
import Plot
import Publish
import VaporDesign

extension Theme where Site == MainSite {
    static var vaporMainSite: Self {
        Theme(htmlFactory: VaporHomePageThemeHTMLFactory())
    }
}

struct VaporHomePageThemeHTMLFactory: HTMLFactory {
    typealias Site = MainSite

    func makeIndexHTML(
        for index: Index,
        context: PublishingContext<Site>
    ) throws -> HTML {
        let isDemo = true
        let body: Node<HTML.DocumentContext> = .body {
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: .main,
                currentMainSitePage: .showcase
            )
            MainPage()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
            Script(url: VaporDesignUtilities.buildResourceLink(for: "/static/js/updateStarsCount.js", isLocal: true))
        }

        let bodyWithClass = body.class("main-site-main-page")
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: index, context: context, body: bodyWithClass.convertToNode())
    }

    func makeSectionHTML(
        for section: Section<Site>,
        context: PublishingContext<Site>
    ) throws -> HTML {
        let body: Node<HTML.DocumentContext> = .body {
            let isDemo = true
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: .main,
                currentMainSitePage: .home,
                isDemo: isDemo
            )
            MainPage()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
            Script(url: VaporDesignUtilities.buildResourceLink(for: "/static/js/updateStarsCount.js", isLocal: true))
        }

        let bodyWithClass = body.class("main-site-main-page")
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: section, context: context, body: bodyWithClass.convertToNode())
    }

    func makeItemHTML(
        for item: Item<Site>,
        context: PublishingContext<Site>
    ) throws -> HTML {
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: item, context: context, body: .body())
    }

    func makePageHTML(
        for page: Page,
        context: PublishingContext<Site>
    ) throws -> HTML {
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: page, context: context, body: .body())
    }

    func makeTagListHTML(
        for page: TagListPage,
        context: PublishingContext<Site>
    ) throws -> HTML? {
        nil
    }

    func makeTagDetailsHTML(
        for page: TagDetailsPage,
        context: PublishingContext<Site>
    ) throws -> HTML? {
        nil
    }
}
