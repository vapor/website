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
            padding: 0 1em;
            line-height: 2.5em;
            text-transform: uppercase;
            box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .2), 0 2px 2px 0 rgba(0, 0, 0, .14), 0 1px 5px 0 rgba(0, 0, 0, .12)
        }

            .vapor-call-to-action__button + .vapor-call-to-action__button {
                margin-left: 1.5em;
            }
    }
</style>

<script>
    export default {
        name: 'vaporCallToAction',
        data() {
            return {
                buttons: [
                    { id: 'start', text: 'Get Started', url: 'https://docs.vapor.codes/3.0/install/macros' },
                    { id: 'community', text: 'Join Chat', url: 'https://discord.gg/vapor' }
                ]
            }
        }
    };
</script>
