<template lang="pug">
  div(class="home")
    div(class="header")
      vapor-smoke(class="smoke")
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
</template>

<script>
export default {
  name: 'home',
  props: { },
  methods: { },
  mounted() { },
  data() {
    return { }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"
.header
  width: 100%
  height: 320px
  position: relative
  overflow: hidden
  background: $color-background-1
  .smoke
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    z-index: 500
  .window
    position: absolute
    width: 600px
    z-index: 750
    left: 50%
    margin-left: -300px
    padding-bottom: 50px
    bottom: -50px
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
.features
  box-shadow: 0 0 70px 4px rgba(0, 0, 0, 0.56)
  padding: 32px 32px
  display: flex
  .feature
    img
      max-width: 64px
      max-height: 64px
    font-size: 18px
    margin: 0 8px
    text-align: center
</style>