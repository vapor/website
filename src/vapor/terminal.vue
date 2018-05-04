<template>
    <div class="terminal">
        <div class="stoplight">
            <div class="light red"></div>
            <div class="light yellow"></div>
            <div class="light green"></div>
        </div>
        <pre><slot></slot></pre>
    </div>
</template>

<style lang="sass" scoped>
    .terminal
        background: #000000
        border-radius: 18px
        width: 630px
        margin: 0 auto
        padding: 0 30px
        padding-top: 60px
        padding-bottom: 6px
        position: relative

        .stoplight
            position: absolute
            top: 14px
            left: 17px
            .light
                width: 20px
                height: 20px
                border-radius: 10px
                float: left
                margin-right: 10px
                &.red
                    background: #FE625D!important
                &.yellow
                    background: #FFC146!important
                &.green
                    background: #2FC950!important
        pre
            padding: 0
            margin: 0
            font-size: 18px
            font-family: 'Roboto Mono', monospace
            font-weight: 500
            color: white
            .keyword
                color: #EA80FC!important
            .type, .method
                color: #80D8FF!important
            .string
                color: #FF80AB!important
</style>

<script>
    export default {
        data () {
            return { }
        }
    }
</script>
