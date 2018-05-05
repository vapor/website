<template>
    <nav class="vapor-nav">
        <ul class="vapor-nav__list">
            <li class="vapor-nav__list-item"
                v-for="(link, index) in navLinks"
                :class="link.title.toLowerCase()">
                <a class="vapor-nav__link"
                   :class="index === 0 ? 'active' : ''"
                   :href="link.url">{{ link.title }}</a>
            </li>
        </ul>
    </nav>

    <!--<div class="header">
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
    </div>-->
</template>

<style lang="scss">
    @import 'src/variables';

    .vapor-nav {
        display: flex;
        align-items: center;

        &:before {
            content: '';
            display: inline-block;
            height: 5em;
            width: 15em;
            background-image: url('assets/vapor-3.png');
            background-size: 100%;
            background-position: center left;
            background-repeat: no-repeat;
        }

        .vapor-nav__list,
        .vapor-nav__list-item {
            display: inline-block;
        }

        .vapor-nav__list {
            width: 100%;
            text-align: right;
        }

        .vapor-nav__list-item {
            text-transform: uppercase;
            font-weight: bold;
        }

        .vapor-nav__link {
            color: black;
            margin: 0 .5em;
            font-size: large;
            text-decoration: none;

            &.active,
            &:hover {
                color: $color-blue;
            }
        }
    }

    /*.header
        width: 100%

    .menu
        padding-top: 36px
        width: 100%


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
                background-color: #00B0FF!important*/
</style>

<script>
    export default {
        name: 'vaporNav',
        data () {
            return {
                navLinks: [
                    { title: 'Code', url: '/' },
                    { title: 'Cloud', url: 'https://vapor.cloud' },
                    { title: 'Docs', url: 'https://docs.vapor.codes' },
                    { title: 'GitHub', url: 'https://github.com/vapor/vapor' }
                ]
            }
        }
    }
</script>
