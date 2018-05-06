<template>
    <header class="vapor-header">
        <h1 class="vapor-header__slogan">The future of web development.</h1>

        <vapor-call-to-action class="vapor-header__call-to-action"/>
    </header>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-header {
        text-align: center;
    }

    @include respond-to(phone) {
        .vapor-header {
            padding-left: 2.5%;
            padding-right: 2.5%;

            .vapor-header__slogan {
                font-size: larger;
            }

            .vapor-header__call-to-action {
                font-size: small;
            }
        }
    }
</style>

<script>
    import VaporCallToAction from 'components/common/callToAction';

    export default {
        name: 'vaporHeader',
        components: {
            [VaporCallToAction.name]: VaporCallToAction
        }
    };
</script>
