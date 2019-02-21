<template>
    <section class="vapor-bio">
        <vapor-card class="vapor-bio__blurb"
                    v-for="(blurb, index) in bioBlurbs"
                    :key="index"
                    :iconSource="blurb.icon"
                    :text="blurb.text"
                    :theme="THEMES.LIGHT"/>
    </section>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-bio {
        display: flex;
        font-size: large;
        padding-top: 2em;
        background-color: black;

        .vapor-bio__blurb {
            display: inline-block;
            width: 33%;
        }

        .vapor-bio__blurb + .vapor-bio__blurb {
            margin-left: 2em;
        }
    }

    @include respond-to(phone) {
        .vapor-bio {
            flex-direction: column;

            .vapor-bio__blurb {
                width: 100%;
                padding: .5em;
            }

            .vapor-bio__blurb + .vapor-bio__blurb {
                margin-left: 0 !important;
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-bio {
            font-size: medium;

            .vapor-bio__blurb + .vapor-bio__blurb {
                margin-left: 0;
            }
        }
    }

    @include respond-to(laptop) {
        .vapor-bio {
            .vapor-bio__blurb {
                width: 100%;
                padding: .5em;
            }

            .vapor-bio__blurb + .vapor-bio__blurb {
                margin-left: 1em;
            }
        }
    }
</style>

<script>
    import VaporCard from 'components/common/card';

    import { THEMES } from 'components/common/card';

    export default {
        name: 'vaporBio',
        components: {
            [VaporCard.name]: VaporCard
        },
        data() {
            return {
                THEMES,
                bioBlurbs: [
                    {
                        icon: this.getImageFor('rocket'),
                        text: this.$t('bio.first')
                    },
                    {
                        icon: this.getImageFor('swift'),
                        text: this.$t('bio.second')
                    },
                    {
                        icon: this.getImageFor('pacman'),
                        text: this.$t('bio.third')
                    }
                ]
            }
        },
        methods: {
            getImageFor(imageName) {
                return require(`./assets/${imageName}.svg`)
            }
        }
    }
</script>
