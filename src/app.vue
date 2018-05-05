<template>
    <v-app class="vapor-app">
        <vapor-nav class="vapor-app__nav"/>

        <vapor-terminal class="vapor-app__terminal"/>

        <div class="dark">
            <div class="wrapper">
                <div class="bios">
                    <vapor-bio image="rocket">Non-blocking, event-driven architecture built on top of Apple's <a target="_blank" href="https://github.com/apple/swift-nio">SwiftNIO</a> delivers <a target="_blank" href="https://medium.com/@codevapor/vapor-3-0-0-released-8356fa619a5d">high performance</a>.</vapor-bio>
                    <vapor-bio image="swift">Written in <a target="_blank" href="https://swift.org">Swift</a>, the powerful programming language that is also easy to learn.</vapor-bio>
                    <vapor-bio image="pacman">Expressive, <a target="_blank" href="https://developer.apple.com/videos/play/wwdc2015/408/">protocol-oriented design</a> with a focus on type-safety and maintainability.</vapor-bio>
                </div>
                <div class="packages">
                    <h3 class="mid-title">Packages</h3>
                    <div class="package-list">
                        <vapor-package repo="http">HTTP</vapor-package>
                        <vapor-package repo="websocket">WebSockets</vapor-package>
                        <vapor-package repo="crypto">Crypto</vapor-package>
                        <vapor-package repo="redis">Redis</vapor-package>

                        <vapor-package repo="mysql">MySQL</vapor-package>
                        <vapor-package repo="postgresql">PostgreSQL</vapor-package>
                        <vapor-package repo="sqlite">SQLite</vapor-package>
                        <vapor-package repo="fluent">Fluent</vapor-package>

                        <vapor-package repo="jwt">JWT</vapor-package>
                        <vapor-package repo="leaf">Leaf</vapor-package>
                        <vapor-package repo="service">Services</vapor-package>
                        <vapor-package repo="auth">Auth</vapor-package>
                    </div>
                </div>
                <div class="buttons">
                    <v-btn href="https://docs.vapor.codes/3.0/install/macos/" class="info">Get Started</v-btn>
                    <v-btn href="https://discord.gg/BnXmVGA" class="info">Join Chat</v-btn>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <div class="contribute">
                <h3 class="mid-title">Contribute!</h3>
                <div class="contribution-methods">
                    <div>
                        <img :src="ghImageURL">
                        <p>Submit feature ideas, report bugs, and merge code on GitHub!</p>
                        <v-btn target="_blank" href="https://github.com/vapor/vapor" class="info">GitHub</v-btn>
                    </div>
                    <div>
                        <img :src="chatImageURL">
                        <p>Help newcomers learn the ropes and get started with Vapor.</p>
                        <v-btn target="_blank" href="https://discord.gg/BnXmVGA" class="info">Join Chat</v-btn>
                    </div>
                    <div>
                        <img :src="ocImageURL">
                        <p>Make a one time or recurring donation to support development.</p>
                        <v-btn target="_blank" href="https://opencollective.com/vapor#sponsor" class="info">Become Backer</v-btn>
                    </div>
                </div>
            </div>
            <div class="sponsors">
                <h3 class="mid-title">Our Sponsors</h3>
                <div class="sponsor-list">
                    <div>
                        <a target="_blank" href="https://www.nodesagency.com">
                            <img :src="nodesImageURL">
                            <p>Nodes</p>
                        </a>
                    </div>
                    <div>
                        <a target="_blank" href="https://www.skelpo.com">
                            <img :src="skelpoImageURL">
                            <p>Skelpo</p>
                        </a>
                    </div>
                    <div>
                        <a href="mailto:sponsor@vapor.codes">
                            <img :src="sponsorImageURL">
                            <p></p>
                        </a>
                    </div>
                    <div>
                        <a href="mailto:sponsor@vapor.codes">
                            <img :src="sponsorImageURL">
                            <p></p>
                        </a>
                    </div>
                    <div>
                        <a href="mailto:sponsor@vapor.codes">
                            <img :src="sponsorImageURL">
                            <p></p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="vapor-footer">
            <div class="footer-nav">
                <a href="mailto:hello@vapor.codes">Contact Us</a>
                <a target="_blank" href="https://twitter.com/codevapor">Twitter</a>
                <a target="_blank" href="https://medium.com/@codevapor">Medium</a>
                <a href="/vapor-presskit-2018-05-04.zip">Press Kit</a>
                <a href="mailto:jobs@vapor.codes">Jobs</a>
            </div>
            <p>&copy; Qutheory, LLC 2018</p>
        </div>
<!--             <v-footer app>
                <span>&copy; Qutheory, LLC 2018</span>
            </v-footer> -->
    </v-app>
</template>

<style lang="sass" scoped>
    .application
        background: white!important
        min-width: 800px
    .btn
        color: white
        margin: 0 18px
        font-size: 18px
        height: 42px
        background-color: #00B0FF!important

    .buttons .btn
        width: 160px

    .wrapper
        padding: 0 66px
        max-width: 1500px
        min-width: 800px
        margin: 0 auto
        width: 100%
    .dark
        color: white
        padding-top: 64px
        background: black
        padding-bottom: 64px
        min-width: 100%
        a
            text-decoration: none
            color: white
            border-bottom: 1px dotted rgba(255, 255, 255, 0.5)
            &:hover
                border-bottom: 1px dotted rgba(255, 255, 255, 0.75)
    .bios
        display: flex
        .bio
            width: 33%


    .mid-title
        text-align: center
        margin-top: 64px
        margin-bottom: 64px
        padding: 0
        font-size: 36px

    .packages
        padding: 0
        .package-list
            display: flex
            flex-wrap: wrap
            justify-content: space-around
            .package
                flex-basis: 33%
                text-align: center
                margin-bottom: 36px
                display: block    

    .buttons
        margin: 0 18px
        padding: 0
        margin-top: 36px
        text-align: center

    .contribution-methods
        display: flex
        padding-bottom: 64px
        div
            width: 33%
            text-align: center
            padding: 0 32px
        img
            height: 66px
        p
            margin-top: 16px
            margin-bottom: 16px
            font-size: 18px

    .sponsor-list
        overflow: hidden
        display: flex
        padding-bottom: 64px
        div
            width: 33%
            text-align: center
            padding: 0 32px

            a
                color: inherit
                text-decoration: none

            img
                width: 112px
                height: 112px

            p
                font-size: 18px

    .vapor-footer
        text-align: center
        color: #9B9B9B
        .footer-nav
            display: block
            margin-bottom: 8px
            a
                font-size: 18px
                display: inline-block
                color: inherit
                text-decoration: none
                &:hover
                    color: white
                    &::after
                        color: #9B9B9B
                &:last-child
                    &::after
                        display: none
                &::after
                    content: '•'
                    margin-left: 8px
                    margin-right: 4px
        padding: 24px 0px
        background: black

        p
            color: #4A4A4A
            margin: 0
            padding: 0
</style>

<script>
    import VaporNav from 'components/nav'
    import VaporTerminal from 'components/terminal'
    import VaporBio from 'components/bio.vue'
    import VaporPackage from 'components/package.vue'

    export default {
        data () {
            return { 
                ghImageURL: require('components/assets/github.png'),
                chatImageURL: require('components/assets/discord.png'),
                ocImageURL: require('components/assets/open-collective.png'),
                nodesImageURL: require('components/assets/nodes.png'),
                skelpoImageURL: require('components/assets/skelpo.png'),
                sponsorImageURL: require('components/assets/sponsor.png'),
            }
        },
        components: {
            [VaporNav.name]: VaporNav,
            'vapor-bio': VaporBio,
            'vapor-package': VaporPackage,
            'vapor-terminal': VaporTerminal,
        }
    }
</script>
