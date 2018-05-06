<template>
    <div class="vapor-app">
        <vapor-nav class="vapor-app__nav"/>

        <main class="vapor-app__content">
            <vapor-header class="vapor-app__header"/>

            <vapor-terminal class="vapor-app__terminal"/>

            <vapor-bio class="vapor-app__bio"/>

            <vapor-packages class="vapor-app__packages"/>

            <vapor-call-to-action class="vapor-app__call-to-action"/>

            <vapor-contribute class="vapor-app__contribute"/>

            <vapor-sponsor class="vapor-app__sponsor"/>


            <div class="vapor-footer">
                <div class="footer-nav">
                    <a href="mailto:hello@vapor.codes">Contact Us</a>
                    <a target="_blank" href="https://twitter.com/codevapor">Twitter</a>
                    <a target="_blank" href="https://medium.com/@codevapor">Medium</a>
                    <a href="/vapor-presskit-2018-05-04.zip">Press Kit</a>
                    <a href="mailto:jobs@vapor.codes">Jobs</a>
                </div>
                <p>&copy; Qutheory, LLC 2018</p>
            </div>
            <!--             <v-footer app>
                            <span>&copy; Qutheory, LLC 2018</span>
                        </v-footer> -->
        </main>
    </div>
</template>

<style lang="sass">
    .vapor-app
        font-family: 'Roboto', sans-serif

    .vapor-app__content
        display: flex
        width: 100%;
        flex-direction: column
        align-items: center

        > *:not(:first-child)
                margin-top: 1em

        .vapor-app__packages, .vapor-app__call-to-action
                margin-top: 0

        .vapor-app__call-to-action
                background-color: black
                width: 100%
                padding: 3em 0

    .application
        background: white!important

    .wrapper
        padding: 0 66px
        max-width: 1500px
        min-width: 800px
        margin: 0 auto
        width: 100%
    .dark-old
        color: white
        padding-top: 64px
        background: black
        padding-bottom: 64px
        min-width: 100%
        a
            text-decoration: none
            color: white
            border-bottom: 1px dotted rgba(255, 255, 255, 0.5)
            &:hover
                border-bottom: 1px dotted rgba(255, 255, 255, 0.75)
    .bios
        display: flex
        .bio
            width: 33%


    .mid-title
        text-align: center
        margin-top: 64px
        margin-bottom: 64px
        padding: 0
        font-size: 36px

    .packages
        padding: 0
        .package-list
            display: flex
            flex-wrap: wrap
            justify-content: space-around
            .package
                flex-basis: 33%
                text-align: center
                margin-bottom: 36px
                display: block    

    .buttons
        margin: 0 18px
        padding: 0
        margin-top: 36px
        text-align: center

    .contribution-methods
        display: flex
        padding-bottom: 64px
        div
            width: 33%
            text-align: center
            padding: 0 32px
        img
            height: 66px
        p
            margin-top: 16px
            margin-bottom: 16px
            font-size: 18px

    .sponsor-list
        overflow: hidden
        display: flex
        padding-bottom: 64px
        div
            width: 33%
            text-align: center
            padding: 0 32px

            a
                color: inherit
                text-decoration: none

            img
                width: 112px
                height: 112px

            p
                font-size: 18px

    .vapor-footer
        text-align: center
        color: #9B9B9B
        .footer-nav
            display: block
            margin-bottom: 8px
            a
                font-size: 18px
                display: inline-block
                color: inherit
                text-decoration: none
                &:hover
                    color: white
                    &::after
                        color: #9B9B9B
                &:last-child
                    &::after
                        display: none
                &::after
                    content: '•'
                    margin-left: 8px
                    margin-right: 4px
        padding: 24px 0px
        background: black

        p
            color: #4A4A4A
            margin: 0
            padding: 0
</style>

<script>
    import VaporNav from 'components/nav'
    import VaporHeader from 'components/header';
    import VaporTerminal from 'components/terminal'
    import VaporBio from 'components/bio'
    import VaporPackages from 'components/packages'
    import VaporCallToAction from 'components/common/callToAction';
    import VaporContribute from 'components/contribute';
    import VaporSponsor from 'components/sponsor';

    export default {
        name: 'vaporApp',
        components: {
            [VaporNav.name]: VaporNav,
            [VaporHeader.name]: VaporHeader,
            [VaporTerminal.name]: VaporTerminal,
            [VaporBio.name]: VaporBio,
            [VaporPackages.name]: VaporPackages,
            [VaporCallToAction.name]: VaporCallToAction,
            [VaporContribute.name]: VaporContribute,
            [VaporSponsor.name]: VaporSponsor
        }
    }
</script>
