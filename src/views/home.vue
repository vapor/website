<template lang="pug">
  div(class="home")
    vapor-smoke(class="smoke")
    div(class="header")
      div(class="text")
        h2 {{ tagline }}
        a(class="button" href="https://docs.vapor.codes/4.0/") Get Started &rarr;
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
                p Non-blocking, event-driven architecture built on top of Apple's #[a(href="https://github.com/apple/swift-nio") SwiftNIO].
              div(class="feature")
                img(src="@/assets/swift.svg")
                p Written in #[a(href="https://swift.org") Swift], the powerful programming language that is also easy to learn.
                p Build amazing websites, APIs, HTTP servers and backends in Swift.
              div(class="feature")
                img(src="@/assets/pacman.svg")
                p Expressive, #[a(href="https://developer.apple.com/videos/play/wwdc2015/408/") protocol-oriented] design with a focus on type-safety.
          div(class="ecosystem")
            h2 Ecosystem.
            p Vapor is more than just a web framework. The project includes over a hundred #[a(href="https://github.com/vapor") official] and #[a(href="https://github.com/vapor-community") community] maintained server-first Swift packages. 
            div(class="packages")
              a(class="package" href="https://github.com/vapor/vapor") Vapor
              a(class="package" href="https://github.com/vapor/fluent") Fluent
              a(class="package" href="https://github.com/vapor/jwt") JWT
              a(class="package" href="https://github.com/vapor/leaf") Leaf
              a(class="package" href="https://github.com/vapor/postgres-nio") Postgres
              a(class="package" href="https://github.com/vapor/mysql-nio") MySQL
              a(class="package" href="https://github.com/vapor/sqlite-nio") SQLite
              a(class="package" href="https://github.com/vapor/fluent-mongo-driver") MongoDB
              a(class="package" href="https://github.com/vapor/queues") Queues
              a(class="package" href="https://github.com/vapor/apns") APNS
              a(class="package" href="https://github.com/vapor/redis") Redis
              a(class="package more" href="https://github.com/vapor") More
          div(class="learn")
            h2 Learn.
            div(class="container")
              div(class="item")
                p Vapor's documentation covers everything from creating your first application to building large projects.
                a(class="button" href="https://docs.vapor.codes/4.0/") Read Docs &rarr;
              div(class="item")
                p The definitive book on building web apps and web APIs with Vapor, written by the creators of the framework.
                a(class="button" href="https://store.kodeco.com/products/server-side-swift-with-vapor") Get Book &rarr;
              div(class="item")
                p Join thousands of Vapor developers in Vapor's team chat. Ask questions, share information, or just hang out.
                a(class="button" href="http://vapor.team") Join Chat &rarr;
          div(class="sponsor")
            div(class="container")
              div(class="info")
                h2 Sponsor!
                p 100% of contributions made through GitHub sponsors go toward supporting the framework. You also get rewards!
                a(class="button" href="https://github.com/sponsors/vapor") Support Vapor &rarr;
              div(class="graphic")
                img(src="@/assets/github-sponsors.png")
          div(class="partners")
            h2 Partners.
            div(class="container")
              a(class="partner" href="https://www.brokenhands.io/")
                img(src="@/assets/brokenhands.png")
                h4 Broken Hands
                p Providing Vapor training and consulting for clients around the world.
              a(class="partner" href="https://omrd.com/")
                img(src="@/assets/omrd.png")
                h4 omrd
                p omrd provides consultation services for dental related scans.
              a(class="partner" href="https://www.emergetools.com")
                img(src="@/assets/emergetoolsstandard.png")
                h4 Emerge Tools
                p Emerge Tools is a suite of revolutionary products designed to supercharge mobile apps and the teams that build them
            p Interested in becoming a partner?
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
    background: lighten(black, 1)
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
    background: darken(#40C4FF, 60)
    background: lighten(black, 3)
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
.features
  display: flex
  flex-wrap: wrap
  margin-bottom: -24px
  @media only screen and (min-width: 700px)
    flex-wrap: none
    margin-bottom: 0
    margin-left: -36px
  .feature
    margin-left: 0
    margin-bottom: 24px
    flex-grow: 1
    @media only screen and (min-width: 700px)
      flex-basis: 0
      margin-bottom: 0
      margin-left: 36px
    img
      height: 32px
    p
      margin-bottom: 0
.ecosystem
  margin-top: 60px
  .packages
    display: flex
    flex-wrap: wrap
    margin-top: -12px
    .package
      width: 50%
      @media only screen and (min-width: 700px)
        width: 196px
      display: inline-block
      text-decoration: none
      color: white
      margin-top: 24px
      font-size: 24px
      &:before
        content: '📦'
        padding-right: 12px
      &.more 
        &:before
          content: '➡️'
.learn
  margin-top: 60px
  .container
    display: flex
    flex-wrap: wrap
    margin-bottom: -24px
    @media only screen and (min-width: 700px)
      flex-wrap: none
      margin-bottom: 0
      margin-left: -36px
    p 
      margin-top: 0
    .item
      flex-grow: 1
      flex-basis: 1
      margin-bottom: 24px
      @media only screen and (min-width: 700px)
        flex-basis: 0
        margin-bottom: 0
        margin-left: 36px
.sponsor
  margin-top: 60px
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
  margin-top: 60px
  .container
    display: flex
    flex-wrap: wrap
    margin-top: -24px
    @media only screen and (min-width: 700px)
      margin-top: 0
      margin-left: -36px
      flex-wrap: none
  .partner
    margin-left: 0
    
    flex-grow: 1
    flex-basis: 1
    text-decoration: none
    color: white
    margin-top: 24px
    @media only screen and (min-width: 700px)
      flex-basis: 0
      margin-left: 36px
      margin-top: 0
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
