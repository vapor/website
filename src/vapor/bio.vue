<template>
    <div class="bio">
        <div class="image">
            <img :src="imageURL">
        </div>
        <p class="text">
            <slot></slot>
        </p>
    </div>
</template>

<style lang="sass" scoped>
    .bio
        padding: 0 30px
        text-align: center
        .image
            height: 60px
            border-radius: 30px
            margin-bottom: 24px
        .text
            color: white
            font-size: 18px
</style>

<script>
    export default {
        props: ['image'],
        data () { 
            return {
                imageURL: require(`./assets/${this.image}.svg`)
            }
        }
    }
</script>
