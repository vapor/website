<template>
    <header class="vapor-header">
        <h1 class="vapor-header__slogan">{{ $t('header.slogan') }}</h1>

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
            .vapor-header__slogan {
                font-size: larger;
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
