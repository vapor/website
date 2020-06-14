<template lang="pug">
  div(class="vapor-menu")
    a(class="logo" href="#" @click="logo")
      img(src="@/assets/logo.png")
      h1 Vapor
    div(class="spacer")
    div(class="nav")
      router-link(:to="{ name: 'home' }") Home
      a(href="https://docs.vapor.codes") Docs
      a(href="https://discord.gg/vapor") Chat
    div(ref="user" class="user")
      div(class="img" @click="showUserMenu = !showUserMenu")
        p(v-if="user") {{ user.name[0] }}
        p(v-else) +
      transition(name='slide-down')
        div(class="menu floating" v-if="showUserMenu" v-closable="{exclude: ['user'], handler: 'closeUserMenu'}")
          div(v-if="user")
            a(href="#" @click="logout") Logout
          div(v-else)
            //- a(href="#" @click="signup") Signup
            a(href="#" @click="login") Login
</template>

<script>
export default {
  name: 'VaporMenu',
  props: ['msg', 'user'],
  methods: {
    logo(e) {
      e.preventDefault()
      this.$router.push({ name: 'home' })
    },
    logout(e) {
      e.preventDefault()
      this.showUserMenu = false
      this.$emit('logout')
    },
    closeUserMenu() {
      this.showUserMenu = false
    },
    login(e) {
      e.preventDefault()
      this.showUserMenu = false
      this.$emit('login')
    },
    signup(e) {
      e.preventDefault()
      this.showUserMenu = false
      alert('signup')
    }
  },
  data () {
    return {
      showUserMenu: false
    }
  }
}
</script>

<style lang="sass">
.vapor-menu
  user-select: none
  display: flex
  flex-direction: column
  @media only screen and (min-width: 700px)
    flex-direction: row
    align-items: center
  padding: 0 32px
  background: black
  color: white
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4)
  position: relative
  .logo
    color: white
    text-decoration: none
    display: flex
    align-items: center
    h1
      margin-left: 16px
    img
      height: 48px
  .spacer
    flex-grow: 0
    @media only screen and (min-width: 700px)
      flex-grow: 1
  .nav
    width: 100%
    @media only screen and (min-width: 700px)
      width: auto
    a
      margin-left: 32px
      &:first-child
        margin-left: 0
      font-size: 18px
      color: white
      text-decoration: none
      &:hover, &.router-link-active
        font-weight: 500
  .user
    cursor: pointer
    position: absolute
    top: 18px
    right: 24px
    @media only screen and (min-width: 700px)
      top: inherit
      right: inherit
      margin-left: 32px
      position: relative
    .img
      height: 48px
      width: 48px
      background: white
      color: black
      border-radius: 50%
      p
        margin: 0
        line-height: 48px
        text-align: center
        font-size: 24px
        font-weight: 600
    .menu
      top: 56px
      left: -176px
      height: auto
      padding: 8px
      width: 224px
      position: absolute
      border-radius: 8px
      a
        color: white
        text-decoration: none
        padding: 8px
        display: block
        &:hover
          font-weight: 500
</style>