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
                    bio:
                        "Server & DevOps engineer focused on performance, security, networking, and systems programming.",
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
                TeamMember(
                    name: "Kyle Browning",
                    handle: "kylebrowning",
                    bio:
                        "iOS engineer and engineering leader who's been shipping since 2008. Maintains APNSwift and builds tools that make iOS and server-side Swift work better together.",
                    avatar: "https://github.com/kylebrowning.png",
                    github: "https://github.com/kylebrowning"
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
                Node<HTML.BodyContext>.raw(
                    "<link rel=\"stylesheet\" href=\""
                        + VaporDesignUtilities.buildResourceLink(
                            for: "/static/css/team.css", isLocal: true) + "\">")
                Div {
                    buildHeader()
                    buildCoreTeam()
                    buildMaintainers()
                    buildContributors()
                    buildCallToAction()
                    buildSponsors()
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
