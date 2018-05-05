<template>
    <div class="package">
        <a target="_blank" :href="`https://github.com/vapor/${repo}`">
            <div class="wrap">
                <img :src="imageURL"><h4><slot></slot></h4>
            </div>
        </a>
    </div>
</template>

<style lang="sass" scoped>
    .package
        height: 30px
        
        line-height: 0px

        a
            width: 100%
            color: inherit
            text-decoration: none

        &:hover
            cursor: pointer

        .wrap
            width: 160px
            display: flex
            margin: 0 auto

        img
            margin-right: 18px
            display: inline-block

        h4
            display: block
            line-height: 30px
            font-size: 20px
            display: inline-block
            position: relative
</style>

<script>
    export default {
        props: ['repo'],
        data () { 
            return { 
                imageURL: require('./assets/check.svg')
            }
        }
    }
</script>
