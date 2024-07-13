import Plot
import Publish
import VaporDesign

struct ComingSoonComponent: Component {
    let title: String

    init(title: String) {
        self.title = title
    }

    var body: any Component {
        Div {
            // Hero
            H1(title).class("main-title")
            H3("This page is still under construction, stay tuned for updates!")
                .class("main-page-caption d-flex mx-auto justify-content-center flex-column align-items-center")

            Div {
                Div {
                    Button {
                        Link("Home", url: "/")
                    }.class("btn btn-primary w-mobile-100")
                }.class("w-mobile-100")
            }.class("main-page-callout-buttons d-flex align-items-center justify-content-center flex-column flex-lg-row")

            // Code sample
            Div {
                let html = """
                import Vapor

                let app = try await Application.make(.detect())

                app.get("showcase") { req in
                    "Coming soon..."
                }

                try await app.execute()








                """
                let code = Node.code(.text(html)).class("language-swift")
                Node.pre(.component(code))
            }.class("main-code-demo mx-auto")
        }.class("main-content")
    }
}
