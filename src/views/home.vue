<template lang="pug">
  div(class="home")
    vapor-smoke(class="smoke")
    div(class="header")
      div(class="text")
        h2 {{ tagline }}
        a(class="button" href="https://docs.vapor.codes/4.0/" target="_blank") Get Started &rarr;
      vapor-window(class="window")
        pre
          code(class="code")
            | #[span.keyword import] Vapor
            | 
            | #[span.keyword let] app = #[span.keyword try] #[span.type Application](.#[span.method detect]())
            | #[span.keyword defer] { app.#[span.method shutdown]() }
            |
            | app.#[span.method get](#[span.string "hello"]) { req #[span.keyword in]
            |     #[span.keyword return] #[span.string "Hello, world."]
            | }
            |
            | #[span.keyword try] app.#[span.method run]()
    div(class="main")
      div(class="content")
        div(class="wrapper")
          div(class="features")
              div(class="feature")
                img(src="@/assets/rocket.svg")
                p Non-blocking, event-driven architecture built on top of Apple's #[a(href="https://github.com/apple/swift-nio" target="_blank") SwiftNIO].
              div(class="feature")
                img(src="@/assets/swift.svg")
                p Written in #[a(href="https://swift.org" target="_blank") Swift], the powerful programming language that is also easy to learn.
              div(class="feature")
                img(src="@/assets/pacman.svg")
                p Expressive, #[a(href="https://developer.apple.com/videos/play/wwdc2015/408/" target="_blank") protocol-oriented] design with a focus on type-safety.
          div(class="ecosystem")
            h2 Ecosystem.
            p Vapor is more than just a web framework. The project includes hundreds of #[a(href="https://github.com/vapor" target="_blank") official] and #[a(href="https://github.com/vapor-community" target="_blank") community] maintained server-first Swift packages. 
            div(class="packages")
              a(class="package" href="https://github.com/vapor/vapor" target="_blank") Vapor
              a(class="package" href="https://github.com/vapor/fluent" target="_blank") Fluent
              a(class="package" href="https://github.com/vapor/jwt" target="_blank") JWT
              a(class="package" href="https://github.com/vapor/leaf" target="_blank") Leaf
              a(class="package" href="https://github.com/vapor/postgres-nio" target="_blank") PostgreSQL
              a(class="package" href="https://github.com/vapor/mysql-nio" target="_blank") MySQL
              a(class="package" href="https://github.com/vapor/sqlite-nio" target="_blank") SQLite
              a(class="package" href="https://github.com/vapor/fluent-mongo-driver" target="_blank") MongoDB
              a(class="package" href="https://github.com/vapor/queues" target="_blank") Queues
              a(class="package" href="https://github.com/vapor/apns" target="_blank") APNS
              a(class="package" href="https://github.com/vapor/apns" target="_blank") Redis
              a(class="package" href="https://github.com/vapor" target="_blank") More
          div(class="learn")
            h2 Learn.
            div(class="container")
              div(class="item")
                p Vapor's documentation covers everything from creating your first application to building large projects.
                a(class="button" href="https://docs.vapor.codes/4.0/" target="_blank") Read Docs &rarr;
              div(class="item")
                p The definitive book on building web apps and web APIs with Vapor, written by the creators of the framework.
                a(class="button" href="https://store.raywenderlich.com/products/server-side-swift-with-vapor" target="_blank") Get Book &rarr;
              div(class="item")
                p Join thousands of Vapor developers in Vapor's team chat. Ask questions, share information, or just hang out.
                a(class="button" href="http://vapor.team" target="_blank") Join Chat &rarr;
          div(class="sponsor")
            div(class="container")
              div(class="info")
                h2 Sponsor!
                p 100% of contributions made through GitHub sponsors go toward supporting the framework. You also get rewards!
                a(class="button" href="https://github.com/sponsors/tanner0101" target="_blank") Support Vapor &rarr;
              div(class="graphic")
                img(src="@/assets/github-sponsors.png")
          div(class="partners")
            h2 Partners.
            div(class="container")
              a(class="partner" href="https://www.nodesagency.com/" target="_blank")
                img(src="@/assets/nodes.png")
                h4 Nodes
                p With hundreds of successful digital projects for our clients, and offices across EMEA filled with passionate in-house developers, designers and digital strategists, we are one of Europe’s leading digital agencies.
              a(class="partner" href="https://skelpo.com/" target="_blank")
                img(src="@/assets/skelpo.png")
                h4 Skelpo
                p Skelpo uses Vapor to build awesome backends and APIs for various projects and clients. We employ some of the core community contributors and love seeing Server-Side Swift grow!
              a(class="partner" href="https://gotranseo.com/" target="_blank")
                img(src="@/assets/transeo.png")
                h4 Transeo
                p Transeo is an educational technology company that builds tracking tools for student planning and data analysis.
            div(class="buttons")
              a(class="button" href="mailto:sponsor@vapor.codes") Become a Partner &rarr;
      div(class="footer")
        p © Qutheory, LLC 2020
</template>

<script>
export default {
  name: 'home',
  props: { },
  methods: { },
  mounted() { },
  computed: {
    tagline() {
      var items = [
        'The future of web development.',
        'Swift, but on a server.',
        'A new type of web framework.'
      ]
      return items[Math.floor(Math.random() * items.length)];
    }
  },
  data() {
    return { }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"
.home
  p
    font-size: 18px
  h2
    font-size: 30px
    @media only screen and (min-width: 700px)
      font-size: 36px
.smoke
  position: fixed
  // background: linear-gradient(to bottom right, #40C4FF, #E040FB)
  top: 0
  left: 0
  right: 0
  bottom: 0
  z-index: 100
.header
  width: 100%
  position: relative
  display: flex
  flex-direction: column
  align-items: center
  z-index: 500
  .text
    display: flex
    position: relative
    flex-direction: column
    align-items: center
    h2
      margin-bottom: 0
      font-size: 26px
      @media only screen and (min-width: 700px)
        font-size: 36px
    .button
      margin-top: 18px
  .window
    margin-top: 24px
    @media only screen and (min-width: 700px)
      margin-top: 36px
    width: 90%
    @media only screen and (min-width: 700px)
      width: 600px
    padding-bottom: 50px
    background: darken(#111, 3)
  .code
    font-family: 'Roboto Mono', monospace
    font-size: 14px
    @media only screen and (min-width: 700px)
      font-size: 18px
    .keyword
      color: #ea80fc
      font-weight: bold
    .method, .type
      color: #80d8ff
    .string
      color: #ff80ab
.main
  position: relative
  z-index: 500
  margin-top: -50px
  .content
    position: relative
    z-index: 500
    background: black
    box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.5)
    padding-bottom: 12px
    .wrapper
      padding: 32px
      @media only screen and (min-width: 700px)
        padding: 48px
      margin: 0 auto
      max-width: 1280px
  .footer
    opacity: 0.25
    padding: 12px 48px
    color: #fff
    text-align: right
.features
  display: flex
  flex-wrap: wrap
  margin-bottom: -24px
  @media only screen and (min-width: 700px)
    flex-wrap: none
    margin-bottom: 0
    margin-left: -24px
  .feature
    margin-left: 0
    margin-bottom: 24px
    flex-grow: 1
    @media only screen and (min-width: 700px)
      flex-basis: 0
      margin-bottom: 0
      margin-left: 24px
    img
      height: 32px
    p
      margin-bottom: 0
.packages
  display: flex
  flex-wrap: wrap
  margin-top: 24px
  .package
    width: 50%
    @media only screen and (min-width: 700px)
      width: 200px
    display: inline-block
    text-decoration: none
    color: white
    padding: 12px 0
    font-size: 24px
    &:before
      content: '✔'
      padding-right: 12px
      color: #2fc950
.get-started
  margin-top: 24px
  display: flex
  justify-content: center
.button
  display: inline-block
  padding: 8px
  @media only screen and (min-width: 700px)
    padding: 12px
  text-decoration: none
  position: relative
  margin-bottom: 4px
  background: white
  color: black
  font-weight: bold
  &::before
    position: absolute
    content: ''
    bottom: -4px
    height: 4px
    width: 100%
    left: (4px / 2)
    transform: skewX(45deg)
    background: #40C4FF
    // background: linear-gradient(#40C4FF 0%, #40C4FF 33%, #6DD2FF 33%, #6DD2FF 66%, #9EE1FF 66%, #9EE1FF 100%)
  &::after
    position: absolute
    content: ''
    right: -4px
    height: 100%
    width: 4px
    bottom: -(4px / 2)
    transform: skewY(45deg)
    background: #E040FB
    // background: linear-gradient(to right, #E040FB 0%, #E040FB 33%, #E76FFC 33%, #E76FFC 66%, #EF9FFD 66%, #EF9FFD 100%)
  &:active
    top: 4px
    left: 4px
    &:after, &:before
      background: none
.learn
  margin-top: 48px
  .container
    display: flex
    flex-wrap: wrap
    margin-bottom: -24px
    @media only screen and (min-width: 700px)
      flex-wrap: none
      margin-bottom: 0
      margin-left: -24px
    p 
      margin-top: 0
    .item
      flex-grow: 1
      flex-basis: 1
      margin-bottom: 24px
      @media only screen and (min-width: 700px)
        flex-basis: 0
        margin-bottom: 0
        margin-left: 24px
.ecosystem
  margin-top: 48px
.sponsor
  margin-top: 48px
  .container
    display: flex
    align-items: top
    h2
      margin-top: 0
    div
      flex-grow: 1
    .info
      max-width: 480px
      p
        margin-top: 0
    .graphic
      display: flex
      justify-content: flex-end
      display: none
      @media only screen and (min-width: 700px)
        display: flex
      img
        margin-top: 24px
        height: 160px
.partners
  margin-top: 48px
  .container
    display: flex
    flex-wrap: wrap
    @media only screen and (min-width: 700px)
      flex-wrap: none
  .partner
    margin-left: 0
    margin-bottom: 24px
    flex-grow: 1
    flex-basis: 1
    text-decoration: none
    color: white
    @media only screen and (min-width: 700px)
      flex-basis: 0
      margin-left: 24px
      margin-bottom: 0
      &:first-child
        margin-left: 0
    img
      height: 64px
    h4
      font-size: 18px
      margin-top: 12px
      margin-bottom: 6px
    p
      margin-top: 0
  .buttons
    margin-top: 12px
    display: flex
</style>