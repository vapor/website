<template>
    <header class="vapor-header">
        <h1 class="vapor-header__slogan">The future of web development.</h1>

        <div class="vapor-header__button-container">
            <a class="vapor-header__button"
               v-for="button in buttons"
               :class="button.id"
               :href="button.url"
               target="_blank">{{ button.text }}</a>
        </div>
    </header>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-header {
        .vapor-header__button-container {
            display: flex;
            justify-content: space-evenly;
        }

        .vapor-header__button {
            @include button();

            font-size: larger;
            width: 10em;
            padding: 0 1em;
            line-height: 2.5em;
            text-transform: uppercase;
            box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .2), 0 2px 2px 0 rgba(0, 0, 0, .14), 0 1px 5px 0 rgba(0, 0, 0, .12)
        }

        .vapor-header__button + .vapor-header__button {
            margin-left: 1.5em;
        }
    }
</style>

<script>
    export default {
        name: 'vaporHeader',
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
