import Plot
import Publish
import VaporDesign

struct TeamPage: Component {
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
                currentMainSitePage: .team
            )
            TeamPage.Content()
            SiteFooter(
                isLocal: false,
                isDemo: isDemo,
                currentSite: .main
            )
            Script(
                url: VaporDesignUtilities.buildResourceLink(
                    for: "/static/js/pagination.js", isLocal: true))
            Script(
                url: VaporDesignUtilities.buildResourceLink(
                    for: "/static/js/contributors.js", isLocal: true))
            Script(
                url: VaporDesignUtilities.buildResourceLink(
                    for: "/static/js/sponsors.js", isLocal: true))
        }.id("team-page-body").class("main-site-faded-background")
    }
}

extension TeamPage {
    struct TeamMember {
        let name: String
        let handle: String
        let bio: String
        let avatar: String
        let github: String?
        let mastodon: String?
        let bluesky: String?
        let linkedin: String?

        init(
            name: String, handle: String, bio: String, avatar: String,
            github: String? = nil, mastodon: String? = nil, bluesky: String? = nil,
            linkedin: String? = nil
        ) {
            self.name = name
            self.handle = handle
            self.bio = bio
            self.avatar = avatar
            self.github = github
            self.mastodon = mastodon
            self.bluesky = bluesky
            self.linkedin = linkedin
        }
    }

    struct Sponsor {
        let name: String
        let url: String
        let logo: String
    }

    struct Content: Component {
        let isLocal: Bool

        init(isLocal: Bool = false) {
            self.isLocal = isLocal
        }

        var coreTeam: [TeamMember] {
            [
                TeamMember(
                    name: "Gwynne Raskind",
                    handle: "@gwynne",
                    bio: "Official Goddess of Swift on Server.",
                    avatar: "https://github.com/gwynne.png",
                    github: "https://github.com/gwynne"
                ),
                TeamMember(
                    name: "Tim Condon",
                    handle: "@0xTim",
                    bio: "Vapor Core Team and collector of Swift Workgroups",
                    avatar: "https://github.com/0xTim.png",
                    github: "https://github.com/0xTim",
                    mastodon: "https://hachyderm.io/@0xTim",
                    bluesky: "https://bsky.app/profile/0xtim.bsky.social"
                ),
            ]
        }

        var maintainers: [TeamMember] {
            [
                TeamMember(
                    name: "Mahdi Bahrami",
                    handle: "@mahdibm",
                    bio: "Vapor maintainer, working across the framework and its ecosystem.",
                    avatar: "https://github.com/mahdibm.png",
                    github: "https://github.com/mahdibm",
                    mastodon: "https://mastodon.social/@MahdiBM"
                ),
                TeamMember(
                    name: "Francesco Paolo Severino",
                    handle: "@fpseverino",
                    bio: "Open source passionate and backend tinkerer",
                    avatar: "https://github.com/fpseverino.png",
                    github: "https://github.com/fpseverino",
                    mastodon: "https://mastodon.social/@fpseverino",
                    bluesky: "https://bsky.app/profile/fpseverino.bsky.social"
                ),
                TeamMember(
                    name: "Paul Toffoloni",
                    handle: "@ptoffy",
                    bio: "Security and performance enthusiast",
                    avatar: "https://github.com/ptoffy.png",
                    github: "https://github.com/ptoffy",
                    bluesky: "https://bsky.app/profile/ptoffy.bsky.social",
                    linkedin: "https://linkedin.com/in/paultoffoloni"
                ),
            ]
        }

        // Hand written sponsors, same as the README
        var sponsors: [Sponsor] {
            [
                Sponsor(
                    name: "Broken Hands", url: "https://www.brokenhands.io",
                    logo: "/static/images/sponsors/brokenhands.png"),
                Sponsor(
                    name: "Emerge Tools", url: "https://www.emergetools.com",
                    logo: "/static/images/sponsors/emerge-tools.png"),
                Sponsor(
                    name: "Jari", url: "https://github.com/MrLotU",
                    logo:
                        "https://user-images.githubusercontent.com/1342803/79599312-426a8580-80b3-11ea-89b3-8b2722485e37.png"
                ),
                Sponsor(
                    name: "Donut Dane", url: "https://github.com/DonutDane",
                    logo:
                        "https://user-images.githubusercontent.com/9938337/265657642-6b6b1705-9611-4547-8e2f-a3773fda87c6.png"
                ),
                Sponsor(
                    name: "MacStadium", url: "https://macstadium.com",
                    logo:
                        "https://uploads-ssl.webflow.com/5ac3c046c82724970fc60918/5c019d917bba312af7553b49_MacStadium-developerlogo.png"
                ),
            ]
        }

        var body: any Component {
            ComponentGroup {
                Node<HTML.BodyContext>.raw("<style>\(TeamPage.css)</style>")
                Div {
                    buildHeader()
                    buildCoreTeam()
                    buildMaintainers()
                    buildContributors()
                    buildSponsors()
                    buildCallToAction()
                }.class("container").class("team-page")
            }
        }

        func buildHeader() -> Component {
            Div {
                H1("Meet the team that builds and maintains Vapor").class("main-title")
                H3(
                    "Vapor is built and maintained by a small core team with the help of an amazing community of contributors and sponsors."
                )
                .class("main-page-caption d-flex mx-auto")
            }.class("team-page-header")
        }

        func buildCoreTeam() -> Component {
            Div {
                Div {
                    ComponentGroup(members: coreTeam.map { teamCard($0) })
                }.class("team-grid")
            }.class("team-core")
        }

        func buildMaintainers() -> Component {
            Div {
                H2("Maintainers").class("team-section-title")
                Div {
                    ComponentGroup(members: maintainers.map { teamCard($0) })
                }.class("team-grid")
            }.class("team-maintainers")
        }

        func teamCard(_ member: TeamMember) -> Component {
            Div {
                Image(url: member.avatar, description: member.name).class("team-avatar")
                Paragraph(member.name).class("team-name")
                Paragraph(member.handle).class("team-handle")
                Paragraph(member.bio).class("team-bio")
                socialLinks(
                    github: member.github,
                    mastodon: member.mastodon,
                    bluesky: member.bluesky,
                    linkedin: member.linkedin
                )
            }.class("team-card")
        }

        func buildContributors() -> Component {
            Div {
                H2("Contributors").class("team-section-title")
                Div {
                    ComponentGroup(members: [])
                }.id("contributors-grid").class("contributors-grid")
                Paragraph {
                    Text("Couldn't load contributors right now — see them all on ")
                    Link("GitHub", url: "https://github.com/vapor/vapor/graphs/contributors")
                        .linkTarget(.blank)
                    Text(".")
                }.id("contributors-empty").class("contributors-empty d-none")
                Navigation {
                    List {
                        ComponentGroup(members: [])
                    }
                    .id("contributors-pagination")
                    .class("pagination justify-content-center team-pagination d-none")
                }.accessibilityLabel("Contributors pagination")
            }.class("team-contributors")
        }

        func buildSponsors() -> Component {
            Div {
                Div {
                    H2 {
                        Span("").id("sponsors-count").attribute(
                            named: "data-sponsors", value: "\(sponsors.count)")
                        Text(" Sponsors are funding Vapor's work")
                    }.class("team-section-title")

                    // Sponsors — curated logos, mirroring the README's 💛 section.
                    Div {
                        H3("Sponsors").class("team-subsection-title")
                        Div {
                            ComponentGroup(
                                members: sponsors.map { sponsor in
                                    Link(url: sponsor.url) {
                                        Image(url: sponsor.logo, description: sponsor.name).class(
                                            "sponsor-logo")
                                    }.linkTarget(.blank).class("sponsor-logo-link")
                                })
                        }.class("sponsors-logos")
                    }.class("sponsors-group")

                    // Backers - populated by querying OpenCollective and
                    // the GitHub README (we have no access to the authenticated GH API here)
                    Div {
                        H3("Backers").class("team-subsection-title")
                        Div {
                            ComponentGroup(members: [])
                        }.id("backers-grid").class("sponsors-grid")
                        Paragraph {
                            Text("Couldn't load backers right now — see them all on ")
                            Link("GitHub", url: "https://github.com/sponsors/vapor").linkTarget(
                                .blank)
                            Text(" and ")
                            Link("OpenCollective", url: "https://opencollective.com/vapor")
                                .linkTarget(.blank)
                            Text(".")
                        }.id("backers-empty").class("contributors-empty d-none")
                        Navigation {
                            List {
                                ComponentGroup(members: [])
                            }
                            .id("backers-pagination")
                            .class("pagination justify-content-center team-pagination d-none")
                        }.accessibilityLabel("Backers pagination")
                    }.class("sponsors-group")
                }.class("container")
            }.class("team-sponsors")
        }

        func buildCallToAction() -> Component {
            Div {
                H2("Want to help us grow? Become a supporter").class("team-cta-title")
                Paragraph(
                    "Vapor is 100% open source and supporter backed. A great way of getting involved is by sponsoring or supporting us monthly."
                )
                .class("team-cta-caption")
                Button {
                    Link("Support Vapor", url: "https://github.com/sponsors/vapor").linkTarget(
                        .blank)
                }.class("btn btn-primary")
            }.class("team-cta")
        }

        func socialLinks(github: String?, mastodon: String?, bluesky: String?, linkedin: String?)
            -> Component
        {
            var links = [Component]()
            if let github {
                links.append(socialLink(url: github, icon: "icon-github-fill", label: "GitHub"))
            }
            if let mastodon {
                links.append(
                    socialLink(url: mastodon, icon: "icon-mastodon-fill", label: "Mastodon"))
            }
            if let bluesky {
                links.append(socialLink(url: bluesky, icon: "icon-bsky-fill", label: "Bluesky"))
            }
            if let linkedin {
                links.append(
                    socialLink(url: linkedin, icon: "icon-linkedin-fill", label: "LinkedIn"))
            }
            return Div {
                ComponentGroup(members: links)
            }.class("team-socials")
        }

        func socialLink(url: String, icon: String, label: String) -> Component {
            Link(url: url) {
                Span {
                    Span(label).class("visually-hidden")
                }.class("vapor-icon \(icon)").accessibilityLabel(label)
            }.linkTarget(.blank)
        }
    }
}

#warning("Remove this once we land the CSS in the design repo")
extension TeamPage {
    static let css = """
        #team-page-body {
            overflow-x: hidden;
        }

        .team-page {
            padding-bottom: 96px;
        }

        .team-page-header {
            text-align: center;
            padding-top: 64px;
            margin-bottom: 64px;
        }

        .team-page-header .main-page-caption {
            max-width: 620px;
            justify-content: center;
        }

        /* Core team */
        .team-core,
        .team-maintainers {
            margin-bottom: 96px;
        }

        .team-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 48px 32px;
        }

        .team-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 300px;
            max-width: 100%;
        }

        .team-avatar {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 3px solid #f0f0f7;
        }

        .team-name {
            font-weight: 600;
            font-size: 20px;
            margin-bottom: 2px;
            color: #141416;
        }

        .team-handle {
            color: #df3efb;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .team-bio {
            color: #666880;
            font-size: 15px;
            line-height: 150%;
            margin-bottom: 16px;
        }

        /* Section headings */
        /* The shared design system caps h2 at max-width: 560px with no auto
           margins, which left-aligns the box; center it here. */
        .team-section-title {
            text-align: center;
            font-weight: 500;
            letter-spacing: -0.02em;
            margin: 0 auto 48px;
        }

        .team-subsection-title {
            text-align: center;
            font-weight: 500;
            font-size: 22px;
            letter-spacing: -0.01em;
            max-width: none;
            margin: 0 auto 28px;
        }

        /* Contributors */
        .team-contributors {
            margin-bottom: 96px;
        }

        .contributors-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 40px 32px;
        }

        .contributor-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            min-width: 0;
        }

        .contributor-avatar {
            width: 96px;
            height: 96px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 14px;
            border: 2px solid #f0f0f7;
        }

        .contributor-name {
            font-weight: 600;
            font-size: 15px;
            margin: 0;
            max-width: 100%;
            overflow-wrap: anywhere;
            color: #141416;
        }

        .team-sponsors {
            margin-left: calc(50% - 50vw);
            margin-right: calc(50% - 50vw);
            margin-bottom: 96px;
            padding-top: 72px;
            padding-bottom: 72px;
            background-color: #fafafd;
        }

        .sponsors-group + .sponsors-group {
            margin-top: 56px;
        }

        .sponsors-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 32px 24px;
            margin-bottom: 32px;
        }

        .sponsors-logos {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 24px;
        }

        .sponsor-logo-link {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 120px;
            width: 200px;
            padding: 20px 24px;
            background: #ffffff;
            border: 1px solid #eaecf0;
            border-radius: 16px;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .sponsor-logo-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 28px rgba(20, 20, 22, 0.1);
        }

        .sponsor-logo {
            max-height: 80px;
            max-width: 100%;
            width: auto;
            object-fit: contain;
        }

        .team-sponsor {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            text-decoration: none;
            transition: transform 0.15s ease;
        }

        a.team-sponsor:hover {
            transform: translateY(-3px);
        }

        .sponsor-avatar {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 2px solid #f0f0f7;
        }

        .sponsor-avatar-fallback {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 600;
            color: #ffffff;
            background: linear-gradient(135deg, #df3efb 0%, #701980 100%);
        }

        .sponsor-name {
            font-size: 13px;
            color: #666880;
            margin: 0;
        }

        .team-pagination {
            margin-top: 24px;
        }

        .team-pagination .page-item.disabled .page-link {
            background-color: transparent;
            border-color: transparent;
            opacity: 0.4;
            pointer-events: none;
        }

        /* Social links */
        .team-socials {
            display: flex;
            gap: 16px;
            justify-content: center;
            align-items: center;
        }

        .team-socials .vapor-icon {
            width: 18px;
            height: 18px;
            background-color: #df3efb;
            transition: background-color 0.15s ease;
        }

        .team-socials a:hover .vapor-icon {
            background-color: #b11fcc;
        }

        .team-socials .icon-linkedin-fill {
            -webkit-mask-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIwLjQ0NyAyMC40NTJoLTMuNTU0di01LjU2OWMwLTEuMzI4LS4wMjctMy4wMzctMS44NTItMy4wMzctMS44NTMgMC0yLjEzNiAxLjQ0NS0yLjEzNiAyLjkzOXY1LjY2N0g5LjM1MVY5aDMuNDE0djEuNTYxaC4wNDZjLjQ3Ny0uOSAxLjYzNy0xLjg1IDMuMzctMS44NSAzLjYwMSAwIDQuMjY3IDIuMzcgNC4yNjcgNS40NTV2Ni4yODZ6TTUuMzM3IDcuNDMzYy0xLjE0NCAwLTIuMDYzLS45MjYtMi4wNjMtMi4wNjUgMC0xLjEzOC45Mi0yLjA2MyAyLjA2My0yLjA2MyAxLjE0IDAgMi4wNjQuOTI1IDIuMDY0IDIuMDYzIDAgMS4xMzktLjkyNSAyLjA2NS0yLjA2NCAyLjA2NXptMS43ODIgMTMuMDE5SDMuNTU1VjloMy41NjR2MTEuNDUyek0yMi4yMjUgMEgxLjc3MUMuNzkyIDAgMCAuNzc0IDAgMS43Mjl2MjAuNTQyQzAgMjMuMjI3Ljc5MiAyNCAxLjc3MSAyNGgyMC40NTFDMjMuMiAyNCAyNCAyMy4yMjcgMjQgMjIuMjcxVjEuNzI5QzI0IC43NzQgMjMuMiAwIDIyLjIyMiAwaC4wMDN6Ii8+PC9zdmc+");
            mask-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIwLjQ0NyAyMC40NTJoLTMuNTU0di01LjU2OWMwLTEuMzI4LS4wMjctMy4wMzctMS44NTItMy4wMzctMS44NTMgMC0yLjEzNiAxLjQ0NS0yLjEzNiAyLjkzOXY1LjY2N0g5LjM1MVY5aDMuNDE0djEuNTYxaC4wNDZjLjQ3Ny0uOSAxLjYzNy0xLjg1IDMuMzctMS44NSAzLjYwMSAwIDQuMjY3IDIuMzcgNC4yNjcgNS40NTV2Ni4yODZ6TTUuMzM3IDcuNDMzYy0xLjE0NCAwLTIuMDYzLS45MjYtMi4wNjMtMi4wNjUgMC0xLjEzOC45Mi0yLjA2MyAyLjA2My0yLjA2MyAxLjE0IDAgMi4wNjQuOTI1IDIuMDY0IDIuMDYzIDAgMS4xMzktLjkyNSAyLjA2NS0yLjA2NCAyLjA2NXptMS43ODIgMTMuMDE5SDMuNTU1VjloMy41NjR2MTEuNDUyek0yMi4yMjUgMEgxLjc3MUMuNzkyIDAgMCAuNzc0IDAgMS43Mjl2MjAuNTQyQzAgMjMuMjI3Ljc5MiAyNCAxLjc3MSAyNGgyMC40NTFDMjMuMiAyNCAyNCAyMy4yMjcgMjQgMjIuMjcxVjEuNzI5QzI0IC43NzQgMjMuMiAwIDIyLjIyMiAwaC4wMDN6Ii8+PC9zdmc+");
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-position: center;
            mask-position: center;
            -webkit-mask-size: contain;
            mask-size: contain;
        }

        .contributors-empty {
            text-align: center;
            color: #666880;
            font-size: 15px;
        }

        /* Call to action */
        .team-cta {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 80px 32px;
            border-radius: 24px;
            text-align: center;
            color: #fafafd;
            background: linear-gradient(120deg, #701980 0%, #2a1a4a 52%, #135b80 100%);
        }

        .team-cta-title {
            color: #ffffff;
            font-weight: 500;
            letter-spacing: -0.02em;
            margin-bottom: 12px;
        }

        .team-cta-caption {
            color: rgba(255, 255, 255, 0.8);
            max-width: 560px;
            margin: 0 auto 28px;
        }

        /* Dark theme */
        .dark .team-page .team-name,
        .dark .team-page .contributor-name {
            color: #f0f0f7;
        }

        .dark .team-page .team-bio,
        .dark .team-page .sponsor-name {
            color: #9fa1bf;
        }

        .dark .team-page .team-avatar,
        .dark .team-page .contributor-avatar,
        .dark .team-page .sponsor-avatar {
            border-color: rgba(255, 255, 255, 0.08);
        }

        .dark .team-page .team-sponsors {
            background-color: #1c1c1f;
        }

        .dark .team-page .sponsor-logo-link {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
        }

        .dark .team-page .sponsor-logo-link:hover {
            box-shadow: 0 10px 28px rgba(0, 0, 0, 0.35);
        }

        @media (max-width: 991.98px) {
            .contributors-grid {
                grid-template-columns: repeat(3, 1fr);
            }

            .sponsors-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        @media (max-width: 575.98px) {
            .contributors-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .sponsors-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        """
}
