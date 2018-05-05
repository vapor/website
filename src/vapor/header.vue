<template>
    <div class="header">
        <div class="menu">
            <div class="logo">
                <h1>Vapor</h1>
            </div>
            <div class="nav">
                <ul>
                    <li><a href="/" class="active">Code</a></li>
                    <li><a href="https://vapor.cloud">Cloud</a></li>
                    <li><a href="https://docs.vapor.codes">Docs</a></li>
                    <li><a href="https://github.com/vapor/vapor">GitHub</a></li>
                </ul>
            </div>
        </div>
        <div class="hero">
            <h2 class="slogan">The future of web development.</h2>
            <div class="buttons">
                <v-btn href="https://docs.vapor.codes/3.0/install/macos/" color="info">Get Started</v-btn>
                <v-btn href="https://discord.gg/vapor" color="info">Join Chat</v-btn>
            </div>
            <vapor-terminal>
<span class="keyword">import</span> Vapor  

<span class="keyword">let</span> app = <span class="keyword">try</span> <span class="type">Application</span>() 
<span class="keyword">let</span> router = <span class="keyword">try</span> app.<span class="method">make</span>(<span class="type">Router</span>.<span class="keyword">self</span>)

  router.<span class="method">get</span>(<span class="string">"hello"</span>) { req <span class="keyword">in </span>&nbsp;    
    <span class="keyword">return</span> <span class="string">"Hello, world."</span>&nbsp;
 }

  <span class="keyword">try</span> app.<span class="method">run</span>()
            </vapor-terminal>
        </div>
    </div>
</template>

<style lang="sass" scoped>
    .header
        width: 100%

    .menu
        padding-top: 36px
        width: 100%

        .logo
            float: left
        .nav
            float: right
            position: relative
            top: 15px

            ul li
                display: inline-block
                a
                    color: black
                    text-transform: uppercase
                    font-size: 18px
                    font-weight: bold
                    margin: 0 8px
                    text-decoration: none

                    &.active, &:hover
                        color: #00B0FF

        .logo
            width: 210px
            height: 58px
            overflow: hidden
            background-image: url(assets/vapor-3.png)
            background-size: 100%
            position: relative
            h1
                position: relative
                top: 58px

    .hero
        margin-top: 48px
        margin-bottom: 64px

        .slogan
            text-align: center
            font-size: 36px

        .buttons
            margin-top: 12px
            text-align: center
            margin-bottom: 30px
            .btn
                margin: 0 18px
                width: 160px
                font-size: 18px
                height: 42px
                background-color: #00B0FF!important
</style>

<script>
    import VaporTerminal from './terminal.vue'

    export default {
        data () {
            return { }
        },
        components: {
            'vapor-terminal': VaporTerminal
        }
    }
</script>
