<template>
  <button 
    class="vapor-button" 
    :class="{ 
      'disabled': disabled, 
      'clear': color == 'clear',
      'danger': color == 'danger' 
    }"
    @click="click"
  >
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: 'vapor-button',
  props: ['disabled', 'color'],
  methods: {
    click(e) {
      e.preventDefault()
      if (this.disabled) {
        return
      }
      this.$emit('action', e)
    }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"
.vapor-button
  padding: 0 16px
  margin-bottom: 8px
  appearance: none
  outline: none
  border: 0
  cursor: pointer
  background: $color-primary
  box-shadow: 0 0 4px rgba($color-primary, 0.75)
  &:hover
    background: lighten($color-primary, 5%)
    box-shadow: 0 0 8px rgba($color-primary, 0.75)
  &.danger
    background: $color-error
    box-shadow: 0 0 4px rgba($color-error, 0.75)
    &:hover
      background: lighten($color-error, 5%)
      box-shadow: 0 0 8px rgba($color-error, 0.75)
  &.clear
    background: $color-white
    color: $color-primary
    box-shadow: none
    .vr-dark &
      background: $color-black
    &:hover
      box-shadow: none
  &:active
    top: 1px
  &.disabled
    filter: saturate(25%)
    cursor: not-allowed
    &:active
      top: 0px
  color: $color-white
  font-family: inherit
  font-size: 16px
  font-weight: 500
  line-height: 40px
  border-radius: 8px
  
  height: 40px
  position: relative
  
</style>