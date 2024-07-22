import Foundation
import Plot
import Publish

struct MainSite: Website {
    enum SectionID: String, WebsiteSectionID {
        case home
        case showcase
        case team
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://vapor.codes")!
    var name = "Vapor"
    var description = "A framework for building APIs, backend servers and websites, in Swift."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try MainSite().publish(using: [
    .copyResources(),
    .addMarkdownFiles(),
    .generateHTML(withTheme: .vaporMainSite),
])
