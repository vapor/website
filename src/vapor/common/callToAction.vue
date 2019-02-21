<template>
    <div class="vapor-call-to-action">
        <a class="vapor-call-to-action__button"
           v-for="button in buttons"
           :class="button.id"
           :href="button.url"
           target="_blank">{{ button.text }}</a>
    </div>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-call-to-action {
        display: flex;
        justify-content: center;

        .vapor-call-to-action__button {
            @include button();

            font-size: larger;
            width: 10em;
        }

        .vapor-call-to-action__button + .vapor-call-to-action__button {
            margin-left: 1.5em;
        }
    }

    @include respond-to(phone) {
        .vapor-call-to-action {
            .vapor-call-to-action__button {
                font-size: small;
            }
        }
    }
</style>

<script>
    export default {
        name: 'vaporCallToAction',
        data() {
            return {
                buttons: [
                    { id: 'start', text: this.$t('callToAction.start'), url: 'https://docs.vapor.codes/3.0/install/macos/' },
                    { id: 'community', text: this.$t('callToAction.join'), url: 'https://discord.gg/vapor' }
                ]
            }
        }
    };
</script>
