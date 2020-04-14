<template lang="pug">
  div(class="vapor-input")
    div(class="box" :class="{ 'focus': focus }")
      label(:for="name") {{ title }}
      input( 
        :name="name" 
        :type="type == null ? 'text' : type" 
        :placeholder="placeholder" 
        :value="value"
        :required="required"
        :disabled="disabled"
        :autocomplete="autocomplete"
        @input="input"
        @focus="focus = true"
        @blur="focus = false"
      )
    small(v-if="detail") {{ detail }}
</template>

<script>
export default {
  name: 'vapor-input',
  props: ['name', 'title', 'placeholder', 'value', 'required', 'disabled', 'detail', 'type', 'autocomplete'],
  methods: {
    input(e) {
      this.$emit('input', e.target.value)
    }
  },
  data() {
    return { focus: false }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"

.vapor-input
  margin-top: 8px
  margin-bottom: 16px
  small
    margin-left: 8px
    font-size: 12px
    color: $color-gray
  .box
    display: block
    width: 100%
    position: relative
    border-radius: 8px
    border: 2px solid $color-dark-gray
    &.focus
      border-color: $color-primary
      label
        color: $color-primary
        font-weight: 500
  label
    position: absolute
    left: 8px
    top: -8px
    line-height: 16px
    font-size: 14px
    font-family: 'Roboto', sans-serif
    background: $color-background-2
    color: $color-light-gray
    padding: 0 8px
    border-radius: 4px
  input
    width: 100%
    height: 48px
    padding: 16px 14px
    padding-top: 18px
    display: block
    font-size: 16px
    font-family: 'Roboto', sans-serif
    border: 0
    background: none
    outline: none
    border-radius: 8px
    &:active
      outline: 0
    &::placeholder
      color: $color-gray
    &:disabled
      cursor: not-allowed
    &:invalid
      // disables firefox red 
      box-shadow: none
    color: $color-white
</style>