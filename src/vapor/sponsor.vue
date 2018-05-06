<template>
    <section class="vapor-sponsor">
        <h3 class="vapor-sponsor__title">Our Sponsors</h3>

        <div class="vapor-sponsor__sponsors-container">
            <a class="vapor-sponsor__link"
               href="mailto:sponsor@vapor.codes"
               v-for="sponsor in sponsors">
                <vapor-card class="vapor-sponsor__sponsor"
                            :iconSource="sponsor.icon || getImageFor('sponsor')"
                            :text="sponsor.text" />
            </a>
        </div>
    </section>
</template>

<style lang="scss">
    .vapor-sponsor {
        text-align: center;

        .vapor-sponsor__title {
            font-size: 2.25em;
        }

        .vapor-sponsor__link {
            font-size: large;
            text-decoration: none;
        }

        .vapor-sponsor__link + .vapor-sponsor__link {
            margin-left: 7em;
        }

        .vapor-sponsor__sponsor {
            .vapor-card__image {
                height: 6.25em;
                width: 6.25em;
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
