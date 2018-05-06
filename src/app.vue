<template>
    <div class="vapor-app">
        <vapor-nav class="vapor-app__nav"/>

        <vapor-header class="vapor-app__header"/>

        <main class="vapor-app__content">
            <vapor-terminal class="vapor-app__terminal"/>

            <vapor-bio class="vapor-app__bio"/>

            <vapor-packages class="vapor-app__packages"/>

            <vapor-call-to-action class="vapor-app__call-to-action"/>

            <vapor-contribute class="vapor-app__contribute"/>

            <vapor-sponsor class="vapor-app__sponsor"/>
        </main>

        <vapor-footer class="vapor-app__footer"/>
    </div>
</template>

<style lang="scss">
    .vapor-app {
        font-family: 'Roboto', sans-serif;

        .vapor-app__nav {
            margin: .5em 10%;
        }

        .vapor-app__header {
            width: 100%;
        }

        .vapor-app__content {
            display: flex;
            width: 100%;
            flex-direction: column;
            align-items: center;

            > * {
                margin-top: 2em;

                &:not(:first-child) {
                    width: 100%;
                    padding-left: 15%;
                    padding-right: 15%;
                }
            }

            .vapor-app__bio {
                display: flex;
            }

            // these share the same background as their neighbor, so we don't want a break
            // in the background color
            .vapor-app__packages,
            .vapor-app__call-to-action {
                margin-top: 0;
            }

            .vapor-app__call-to-action {
                background-color: black;
                width: 100%;
                padding: 4em 0 3em;
            }
        }
    }
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
    import VaporFooter from 'components/footer';

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
            [VaporSponsor.name]: VaporSponsor,
            [VaporFooter.name]: VaporFooter
        }
    }
</script>
