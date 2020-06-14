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
        div(class="features")
            div(class="feature")
              img(src="@/assets/rocket.svg")
              p Non-blocking, event-driven architecture built on top of Apple's #[a(href="https://github.com/apple/swift-nio") SwiftNIO].
            div(class="feature")
              img(src="@/assets/swift.svg")
              p Written in #[a(href="https://swift.org") Swift], the powerful programming language that is also easy to learn.
            div(class="feature")
              img(src="@/assets/pacman.svg")
              p Expressive, #[a(href="https://developer.apple.com/videos/play/wwdc2015/408/") protocol-oriented] design with a focus on type-safety.
        div(class="get-started")
          a(class="button" href="https://docs.vapor.codes/4.0/") Get Started &rarr;
        div(class="learn")
          div(class="wrapper")
            h2 Learn.
            div(class="container")
              div(class="item")
                p Vapor's documentation covers everything from creating your first app to building large projects.
                a(class="button" href="https://docs.vapor.codes/4.0/") Read Docs &rarr;
              div(class="item")
                p The definitive book on building web apps and web APIs with Vapor, written by the creators of the framework.
                a(class="button" href="https://store.raywenderlich.com/products/server-side-swift-with-vapor") Get Book &rarr;
              div(class="item")
                p Join thousands of Vapor developers in Vapor's team chat. Ask questions, share information, or just hang out.
                a(class="button" href="http://vapor.team") Join Chat &rarr;
        div(class="sponsor")
          h2 Sponsor!
          div(class="container")
            img(src="@/assets/github-sponsors.png")
            div(class="info")
              p 100% of contributions made through GitHub sponsors go toward supporting the framework. You also get #[a(href="https://github.com/sponsors/tanner0101") rewards]!
              a(class="button" href="https://github.com/sponsors/tanner0101") Support Vapor &rarr;
        div(class="partner")
          h2 Partners.
          div(class="container")
            div(class="partner")
              p Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porttitor, lorem at.
            div(class="partner")
              p Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porttitor, lorem at.
            div(class="partner")
              p Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porttitor, lorem at.
          div(class="buttons")
            a(class="button" href="https://docs.vapor.codes/4.0/") Become a Partner &rarr;
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
        'Your new favorite web framework.'
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
.smoke
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: 0
  z-index: 100
.header
  width: 100%
  position: relative
  overflow: hidden
  display: flex
  flex-direction: column
  align-items: center
  z-index: 500
    // background: linear-gradient(to bottom right, #ea80fc, #1ab8ff)
    // opacity: 0.75
  .text
    display: flex
    position: relative
    flex-direction: column
    align-items: center
    h2
      font-size: 36px
      margin-bottom: 0
    .button
      margin-top: 18px
  .window
    margin-top: 36px
    width: 600px
    padding-bottom: 50px
    background: $color-background-1
  .code
    font-family: 'Roboto Mono', monospace
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
    padding-top: 32px
    padding-bottom: 32px
  .footer
    padding: 12px 32px
    color: #ccc
    text-align: center
.features
  padding: 0 32px
  display: flex
  max-width: 1280px
  margin: 0 auto
  .feature
    img
      height: 64px
    font-size: 18px
    margin: 0 8px
    text-align: center
.get-started
  margin-top: 24px
  display: flex
  justify-content: center
.button
  display: inline-block
  padding: 12px
  text-decoration: none
  position: relative
  margin-bottom: 6px

  &::before
    position: absolute
    content: ''
    bottom: -6px
    height: 6px
    width: 100%
    left: 3px
    transform: skewX(45deg)
    background-color: #1ab8ff

  &::after
    position: absolute
    content: ''
    right: -6px
    height: 100%
    width: 6px
    bottom: -3px
    transform: skewY(45deg)
    background-color: #ea80fc
  // border-radius: 6px 
  // border-bottom: 3px solid #1ab8ff
  // border-right: 3px solid #ea80fc

  background: white
  color: black
  font-weight: bold

    // border: 1px solid #1ab8ff
    // color: #1ab8ff
    // &:hover
    //   background: #1ab8ff
    //   color: white

    // color: white
    // background: #1ab8ff
    // box-shadow: 0px 2px 5px rgba(lighten(#1ab8ff, 10), 0.5)
.learn
  padding: 48px 0
  background: darken(#1ab8ff, 50)
  margin-top: 32px
  .wrapper
    padding: 0 32px
    margin: 0 auto
    max-width: 1280px
  h2
    margin-top: 0
    font-size: 36px
  .container
    display: flex
    p 
      margin-top: 0
    .item
      flex-grow: 1
      flex-basis: 0
      margin-left: 24px
      &:first-child
        margin-left: 0
.sponsor
  padding: 0 32px
  margin: 0 auto
  margin-top: 32px
  max-width: 1280px
  h2
    font-size: 36px
  .container
    display: flex
    align-items: center
    justify-content: center
    img
      height: 200px
    .info
      margin-left: 24px
      max-width: 480px
.partner
  padding: 0 32px
  margin: 0 auto
  margin-top: 32px
  max-width: 1280px
  h2
    font-size: 36px
  .container
    display: flex
  .partner
    padding: 0
    margin: 0
    margin-left: 24px
    &:first-child
      margin-left: 0
    p
      margin-top: 0
  .buttons
    margin-top: 12px
    display: flex
    justify-content: center
</style>