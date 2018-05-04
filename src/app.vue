<template>
    <v-app>
        <div class="wrapper">
            <vapor-header></vapor-header>
        </div>
        <div class="dark">
            <div class="wrapper">
                <div class="bios">
                    <vapor-bio image="rocket">Non-blocking, event-driven architecture built on top of Apple's <a href="https://github.com/apple/swift-nio">SwiftNIO</a> delivers <a href="#">high performance</a>.</vapor-bio>
                    <vapor-bio image="swift">Written in <a href="https://swift.org">Swift</a>, the powerful programming language that is also easy to learn.</vapor-bio>
                    <vapor-bio image="pacman">Expressive, <a href="https://developer.apple.com/videos/play/wwdc2015/408/">protocol-oriented design</a> with a focus on type-safety and maintainability.</vapor-bio>
                </div>
            </div>
        </div>
<!--             <v-footer app>
                <span>&copy; Qutheory, LLC 2018</span>
            </v-footer> -->
    </v-app>
</template>

<style lang="sass" scoped>
    .wrapper
        padding: 0 66px
        max-width: 1500px
        min-width: 800px
        margin: 0 auto
        width: 100%
    .dark
        padding-top: 64px
        background: black
        padding-bottom: 64px
        a
            text-decoration: none
            color: white
            border-bottom: 1px dotted rgba(255, 255, 255, 0.5)
            &:hover
                border-bottom: 1px dotted rgba(255, 255, 255, 0.75)
    .bios
        display: flex
</style>

<script>
    import VaporHeader from './vapor/header.vue'
    import VaporBio from './vapor/bio.vue'

    export default {
        data () {
            return { }
        },
        components: {
            'vapor-header': VaporHeader,
            'vapor-bio': VaporBio
        }
    }
</script>
