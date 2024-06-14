import Foundation
import Plot
import Publish

struct Homepage: Website {
    enum SectionID: String, WebsiteSectionID {
        case main
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://vapor.codes")!
    var name = "Vapor Homepage"
    var description = "A description of Homepage"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try Homepage().publish(using: [
    .copyResources(),
    // Here we remove the default .addMarkdownFiles() which we don't need
    .generateHTML(withTheme: .vaporHomePage)
])
