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
            SiteNavigation(
                context: context,
                selectedSelectionID: nil,
                currentSite: .main,
                currentMainSitePage: .showcase
            )
            ComingSoonComponent(title: "Showcase")
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
        }.class("main-site-faded-background")
    }
}
