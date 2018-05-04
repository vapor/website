<template>
    <div class="bio">
        <div class="image">
            
        </div>
        <p class="text">
            <slot></slot>
        </p>
    </div>
</template>

<style lang="sass" scoped>
    .bio
        padding: 0 30px
        .image
            margin: 0 auto
            background: white
            width: 60px
            height: 60px
            border-radius: 30px
            margin-bottom: 24px
        .text
            color: white
            text-align: center
            font-size: 18px
</style>

<script>
    export default {
        data () {
            return { }
        }
    }
</script>
