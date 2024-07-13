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
        let isDemo = false
        let currentPage = getCurrentPage(from: index.path.string)
        let body = makePage(for: currentPage, context: context, isDemo: isDemo)
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: index, context: context, body: body.convertToNode())
    }

    func makeSectionHTML(
        for section: Section<Site>,
        context: PublishingContext<Site>
    ) throws -> HTML {
        let currentPage = getCurrentPage(from: section.path.string)
        let isDemo = false
        let body = makePage(for: currentPage, context: context, isDemo: isDemo)
        let builder = VaporDesign<Site>(siteLanguage: context.site.language, isLocal: false)
        return builder.buildHTML(for: section, context: context, body: body.convertToNode())
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

    private func makePage(for page: CurrentPage, context: PublishingContext<MainSite>, isDemo: Bool) -> any Component {
        switch page {
        case .home:
            HomePage(context: context, isDemo: isDemo)
        case .showcase:
            ShowcasePage(context: context, isDemo: isDemo)
        case .team:
            TeamPage(context: context, isDemo: isDemo)
        default:
            HomePage(context: context, isDemo: isDemo)
        }
    }

    private func getCurrentPage(from path: String) -> CurrentPage {
        switch path {
        case "/":
            .home
        case "/showcase", "/showcase/", "showcase":
            .showcase
        case "/team", "/team/", "team":
            .team
        default:
            .home
        }
    }
}
