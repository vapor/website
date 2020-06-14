<template lang="pug">
  div(class="vapor-window")
    div(class="stoplight")
      div(class="light red")
      div(class="light yellow")
      div(class="light green")
    div(class="content")
      slot
</template>

<script>
export default {
  name: 'vapor-window',
  props: ['code'],
  methods: { },
  data() {
    return {  }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"

.vapor-window
  background: #000
  border-radius: 10px
  box-shadow: 0 22px 70px 4px rgba(0, 0, 0, 0.56)
  position: relative

  .content
    padding: 0 18px
    padding-top: 24px
    @media only screen and (min-width: 700px)
      padding: 0 24px
      padding-top: 36px
      padding-bottom: 6px

  .stoplight
    position: absolute
    display: flex
    margin-top: 8px
    margin-left: 4px
    .light
      margin-left: 8px
      width: 14px
      height: 14px
      border-radius: 7px
      &.red
        background: #fe625d
      &.yellow
        background: #ffc146
      &.green
        background: #2fc950

</style>