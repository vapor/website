<template>
    <section class="vapor-contribute">
        <h3 class="vapor-contribute__title">Contribute!</h3>

        <div class="vapor-contribute__opportunity-container">
            <vapor-card class="vapor-contribute__opportunity"
                        v-for="(opp, index) in opportunities"
                        :key="index"
                        :iconSource="opp.icon"
                        :text="opp.text"
                        :theme="THEMES.DARK"
                        :action="opp.action"/>
        </div>
    </section>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-contribute {
        text-align: center;

        .vapor-contribute__title {
            font-size: 2.25em;
        }
        
        .vapor-contribute__opportunity-container {
            display: flex;
        }

        .vapor-contribute__opportunity {
            font-size: large;
            width: 33%;

            .vapor-card__blurb-text {
                flex: 1;
            }
        }

        .vapor-contribute__opportunity + .vapor-contribute__opportunity {
            margin-left: 1.75em;
        }
    }

    @include respond-to(phone) {
        .vapor-contribute {
            .vapor-contribute__title {
                font-size: x-large;
                margin: .25em 0 .5em;
            }

            .vapor-contribute__opportunity-container {
                flex-direction: column;
            }

            .vapor-contribute__opportunity {
                font-size: large;
                width: unset;
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-contribute {
            .vapor-contribute__opportunity {
                .vapor-card__image {
                    height: 3em;
                    width: 3em;
                }

                .vapor-card__blurb-text {
                    font-size: medium;
                }

                .vapor-card__button {
                    font-size: small !important;
                }
            }

            .vapor-contribute__opportunity + .vapor-contribute__opportunity {
                margin-left: 0 !important;
            }
        }
    }

    @include respond-to(laptop) {
        .vapor-contribute {
            .vapor-contribute__opportunity {
                .vapor-card__button {
                    font-size: medium;
                }
            }

            .vapor-contribute__opportunity + .vapor-contribute__opportunity {
                margin-left: .5em;
            }
        }
    }
</style>

<script>
    import VaporCard from 'components/common/card';

    import THEMES from 'components/common/card';

    export default {
        name: 'vaporContribute',
        components: {
            [VaporCard.name]: VaporCard
        },
        data() {
            return {
                THEMES,
                opportunities: [
                    {
                        icon: this.getImageFor('github'),
                        text: 'Submit feature ideas, report bugs, and merge code on GitHub!',
                        action: {
                            text: 'GitHub',
                            url: 'https://github.com/vapor/vapo'
                        }
                    },
                    {
                        icon: this.getImageFor('discord'),
                        text: 'Help newcomers learn the ropes and get started with Vapor.',
                        action: {
                            text: 'Join Chat',
                            url: 'https://discord.gg/BnXmVGA'
                        }
                    },
                    {
                        icon: this.getImageFor('open-collective'),
                        text: 'Make a one time or recurring donation to support development.',
                        action: {
                            text: 'Become Backer',
                            url: 'https://opencollective.com/vapor#sponsor'
                        }
                    }
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
