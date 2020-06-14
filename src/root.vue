<template lang="pug">
div(class="root")
  vapor-loading-bar(class="loading-bar" :loading="loading")

  div(v-if="notification" class="notification" :class="notification.type")
    strong {{ notification.title }}
    p {{ notification.message }}

  div(class="content" :class="{ loading: loading }")
    vapor-menu(
      class="menu" 
      :user="user" 
      @login="showLogin = true"
      @logout="logout"
    )

    div(class="view")
      router-view(@login="login")

    transition(name="fade-in")
      div(class="backdrop" v-if="showLogin" @click="showLogin = false")

    transition(name="appear-up")
      div(class="login floating" v-if="showLogin")
        h2 Login
        vapor-form(ref="form" @action="submitLogin")
          vapor-input(
            title="Email" 
            type="email" 
            required 
            v-model="email"
          )
          vapor-input(
            title="Password" 
            type="password"  
            required 
            v-model="password"
          )
          div(class="buttons")
            div(class="spacer")
            vapor-button(@action="$refs.form.submit()") Login
</template>

<script>
export default {
  name: 'app',
  props: { },
  methods: {
    async login(data) {
      this.$notify.loading.start()
      let res = await this.$api.users.login(this.email, this.password)
      await this.startSession(res.token)
    },
    async startSession(token) {
      this.token = token
      window.localStorage.setItem('vapor-user-token', token)
      this.$api.users.headers['authorization'] = 'Bearer ' + token

      this.$notify.loading.start()
      try {
        let user = await this.$api.users.me()
        this.user = user
      } catch(error) {
        this.logout()
        this.$notify.info('Logged out', 'Your session has expired.')
      } finally {
        this.$notify.loading.stop()
      }
    },
    async submitLogin() {
      await this.login({
        email: this.email,
        password: this.password
      })
      this.showLogin = false
    },
    logout() {
      window.localStorage.removeItem('vapor-user-token')
      this.token = null
      this.user = null
    },
    closeLogin() {
      this.showLogin = false
    }
  },
  async mounted () {
    var app = this

    // configure notify pushing
    this.$notify.push = (config) => {
      clearTimeout(this.notificationTimeout)
      app.notification = config
      app.notificationTimeout = setTimeout(() => { 
        app.notification = null
      }, 3000)
    }
    
    // configure loading state
    this.$notify.loading = {
      start() {
        app.loading = true
      },
      stop() {
        app.loading = false
      }
    }

    // check for stored token
    var token = window.localStorage.getItem('vapor-user-token')
    if(token) {
      await this.startSession(token)
    } else {
      this.user = false
    }
  },
  data() {
    return {
      token: null,
      user: null,
      notification: null,
      loading: false,
      showLogin: false,
      email: null,
      password: null
    }
  }
}
</script>

<style lang="sass">
@import "@/assets/base.sass"

body
  background: #000
  color: white

.appear-up-enter-active, .appear-up-leave-active
  transition: opacity 300ms cubic-bezier(0.215, 0.61, 0.355, 1), transform 300ms cubic-bezier(0.215, 0.61, 0.355, 1)
.appear-up-enter, .appear-up-leave-to
  opacity: 0
  transform: scale(0.9)

.slide-up-leave-active
  position: absolute
.slide-up-enter-active, .slide-up-leave-active
  transition: opacity 300ms cubic-bezier(0.215, 0.61, 0.355, 1), transform 300ms cubic-bezier(0.215, 0.61, 0.355, 1)
.slide-up-enter, .slide-up-leave-to
  opacity: 0
  transform: translate(0, 32px)

.slide-down-leave-active
  position: absolute
.slide-down-enter-active, .slide-down-leave-active
  transition: opacity 300ms cubic-bezier(0.215, 0.61, 0.355, 1), transform 300ms cubic-bezier(0.215, 0.61, 0.355, 1)
.slide-down-enter, .slide-down-leave-to
  opacity: 0
  transform: translate(0, -16px)

.fade-in-leave-active
  position: absolute
.fade-in-enter-active, .fade-in-leave-active
  transition: opacity 300ms cubic-bezier(0.215, 0.61, 0.355, 1), transform 300ms cubic-bezier(0.215, 0.61, 0.355, 1)
.fade-in-enter, .fade-in-leave-to
  opacity: 0

.floating
  background: $color-background-2
  @supports (backdrop-filter: blur(10px))
    background: rgba(255, 255, 255, 0.1)
    backdrop-filter: blur(10px)
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4)

body, html
  height: 100%
  font-family: 'Roboto', sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale

p 
  a
    color: #00b0ff
    text-decoration: none
    position: relative
    &:hover
      color: lighten(#00b0ff, 10)
    &:active
      top: 1px
</style>

<style scoped lang="sass">
@import "@/assets/base.sass"
.root
  position: relative
  height: 100%

  .content
    padding-top: 80px
    height: 100%
    overflow-y: auto

    &.loading
      filter: saturate(25%)
      pointer-events: none
      cursor: wait

  .menu
    position: absolute
    z-index: 900
    box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.5)
    top: 0
    left: 0
    right: 0
    height: 80px

.view
  // padding: 0 32px
  overflow: hidden

.backdrop
  position: fixed
  top: 0
  left: 0
  right: 0
  bottom: 0
  background: rgba(0, 0, 0, 0.25)

.login
  position: fixed
  top: 100px
  width: 320px
  left: 50%
  margin-left: -160px
  border-radius: 8px
  padding: 16px 24px
  h2
    margin: 0
    margin-top: 8px
    margin-bottom: 32px
  img
    height: 32px

  .buttons
    display: flex
    .spacer
      flex-grow: 1

.notification
  background: white
  width: 300px
  position: fixed
  top: 16px
  left: 50%
  margin-left: -150px
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5)
  border-radius: 8px
  padding: 16px
  z-index: 999

  strong, p
    margin: 0
    padding: 0

  &.error
    color: red
</style>