<template lang="pug">
  div(class="vapor-loading-bar" :class="{ 'loading': loading }")
</template>

<script>
export default {
  name: 'vapor-loading-bar',
  props: ['loading']
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"

@keyframes fade
  0%, 100%
    opacity: 0.2
  50%
    opacity: 0.8

.vapor-loading-bar
  position: fixed
  z-index: 990
  top: 0
  left: 0
  right: 0
  height: 6px
  opacity: 0
  background: $color-primary
  transition: opacity $animation-duration $animation-ease
  &.loading
    animation: fade 1s infinite
</style>
