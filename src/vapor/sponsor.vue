<template>
    <section class="vapor-sponsor">
        <h3 class="vapor-sponsor__title">Our Sponsors</h3>

        <a class="vapor-sponsor__link"
           href="mailto:sponsor@vapor.codes"
           v-for="sponsor in sponsors">
            <vapor-card class="vapor-sponsor__sponsor"
                        :class="sponsor.icon ? '' : 'empty'"
                        :iconSource="sponsor.icon || getImageFor('sponsor')"
                        :text="sponsor.text" />
        </a>
    </section>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-sponsor {
        text-align: center;

        .vapor-sponsor__title {
            font-size: 2.25em;
        }

        .vapor-sponsor__link {
            font-size: large;
            text-decoration: none;
        }

        .vapor-sponsor__sponsor {
            width: 20%;
            
            .vapor-card__image {
                height: 6.25em;
                width: 6.25em;
            }
        }
    }

    @include respond-to(phone) {
        .vapor-sponsor {
            .vapor-sponsor__title {
                font-size: x-large;
            }

            .vapor-sponsor__sponsor {
                .vapor-card__image {
                    height: 4em;
                    width: 4em;
                }
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-sponsor {
            .vapor-sponsor__sponsor {
                width: 50% !important;
                padding-bottom: .5em;

                .vapor-card__image {
                    height: 5em;
                    width: 5em;
                }
            }
        }
    }

    @include respond-to(laptop) {
        .vapor-sponsor {
            .vapor-sponsor__sponsor {
                width: 33%;

                .vapor-card__blurb-text {
                    margin-bottom: 0;
                }
            }
        }
    }
</style>

<script>
    import VaporCard from 'components/common/card';

    export default {
        name: 'vaporSponsor',
        components: {
            [VaporCard.name]: VaporCard
        },
        data() {
            return {
                sponsors: [
                    {
                        icon: this.getImageFor('nodes'),
                        text: 'Nodes',
                        url: 'https://www.nodesagency.com'
                    },
                    {
                        icon: this.getImageFor('skelpo'),
                        text: 'Skelpo',
                        url: 'https://www.skelpo.com'
                    },
                    { }, { }, { } // to be filled as sponsors are added
                ]
            }
        },
        methods: {
            getImageFor(imageName) {
                return require(`./assets/${imageName}.png`);
            }
        }
    };
</script>
