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
</template>

<style lang="scss">
    @import 'src/variables';
    @import 'src/mixins';

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

    @include respond-to(phablet) {
        .vapor-nav {
            flex-direction: column;

            .vapor-nav__list {
                padding: 0;
                text-align: center;
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-nav {
            font-size: small;
        }
    }
</style>

<script>
    export default {
        name: 'vaporNav',
        data () {
            return {
                navLinks: [
                    { title: this.$t('nav.code'), url: '/' },
                    { title: this.$t('nav.cloud'), url: 'https://vapor.cloud' },
                    { title: this.$t('nav.docs'), url: 'https://docs.vapor.codes' },
                    { title: 'Github', url: 'https://github.com/vapor/vapor' }
                ]
            }
        }
    }
</script>
