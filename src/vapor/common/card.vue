<template>
    <article class="vapor-card"
             :class="theme">
        <img class="vapor-card__image"
             :src="iconSource"/>

        <p class="vapor-card__blurb-text"
           v-html="text"></p>

        <a class="vapor-card__button"
           v-if="action"
           :href="action.url || ''"
           :target="action.target || '_blank'"
           @click="onActionButtonClicked()">{{ action.text }}</a>
    </article>
</template>

<style lang="scss">
    @import 'src/mixins';

    .vapor-card {
        padding: 1em;

        &.dark {
            color: black;

            .vapor-card__blurb-text {
                a {
                    color: inherit;
                    border-bottom: 1px dotted black;
                }
            }
        }
        &.light {
            color: white;

            .vapor-card__blurb-text {
                a {
                    color: inherit;
                    border-bottom: 1px dotted hsla(0, 0%, 100%, .5);

                    &:hover {
                        border-bottom-color: hsla(0, 0%, 100%, .75);
                    }
                }
            }
        }

        .vapor-card__image {
            display: block;
            margin: 0 auto;
            padding: 0;
            border-style: none;
            user-select: none;
        }

        .vapor-card__blurb-text {
            display: inline-block;
            text-align: center;

            a {
                text-decoration: none;
            }
        }

        .vapor-card__button {
            @include button();
            // TODO: Action styling
        }
    }
</style>

<script>
    export const THEMES = {
        LIGHT: 'light',
        DARK: 'dark'
    };

    export default {
        name: 'vaporCard',
        props: {
            theme: {
                type: String,
                default: THEMES.DARK
            },
            iconSource: {
                type: String
            },
            text: {
                type: String,
                default: ''
            },
            action: {
                type: Object,
                default: null
            }
        },
        methods: {
            onActionButtonClicked() {
                if (this.action.callback) {
                    this.action.callback();
                }
            }
        }
    };
</script>
