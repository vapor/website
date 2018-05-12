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
    @import 'src/variables';
    @import 'src/mixins';

    .vapor-bio {
        display: flex;
        font-size: large;
        padding-top: 2em;
        background-color: $color-apple-dark-gray;

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
                        text: 'Non-blocking, event-driven architecture built on top of Apple\'s <a target="_blank" href="https://github.com/apple/swift-nio">SwiftNIO</a> delivers <a target="_blank" href="https://medium.com/@codevapor/vapor-3-0-0-released-8356fa619a5d">high performance</a>.'
                    },
                    {
                        icon: this.getImageFor('swift'),
                        text: 'Written in <a target="_blank" href="https://swift.org">Swift</a>, the powerful programming language that is also easy to learn.'
                    },
                    {
                        icon: this.getImageFor('pacman'),
                        text: 'Expressive, <a target="_blank" href="https://developer.apple.com/videos/play/wwdc2015/408/">protocol-oriented design</a> with a focus on type-safety and maintainability.'
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
