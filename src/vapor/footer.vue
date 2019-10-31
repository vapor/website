<template>
    <footer class="vapor-footer">
        <div class="vapor-footer__link-container">
            <a class="vapor-footer__link"
                v-for="link in links"
                :target="link.target"
                rel="noopener"
                :href="link.url">{{ link.text }}</a>
        </div>

        <small class="vapor-footer__copyright">&copy; Qutheory, LLC 2018</small>
    </footer>
</template>

<style lang="scss">
    @import 'src/variables';
    @import 'src/mixins';

    .vapor-footer {
        color: $color-gray;
        background-color: black;
        width: 100%;
        padding: 2em 0;
        text-align: center;

        .vapor-footer__link {
            color: inherit;
            font-size: larger;
            text-decoration: none;

            &:hover {
                color: white;
            }
        }

        .vapor-footer__link + .vapor-footer__link {
            &::before {
                color: $color-gray !important;
                content: '\2022';
                margin: 0 .4em;
            }
        }

        .vapor-footer__copyright {
            display: block;
            color: $color-dark-gray;
            margin-top: 1em;
        }
    }

    @include respond-to(phone) {
        .vapor-footer {
            .vapor-footer__link {
                display: block;
            }

            .vapor-footer__link + .vapor-footer__link {
                margin-top: .25em;

                &::before {
                    content: '';
                    margin: 0;
                }
            }
        }
    }
</style>

<script>
    export default {
        name: 'vaporFooter',
        data() {
            return {
                links: [
                    { text: this.$t('footer.contact'), url: 'mailto:hello@vapor.codes' },
                    { text: 'Twitter', url: 'https://twitter.com/codevapor', target: '_blank' },
                    { text: 'Medium', url: 'https://medium.com/@codevapor', target: '_blank' },
                    { text: this.$t('footer.press'), url: '/vapor-presskit-2018-05-04.zip' },
                    { text: this.$t('footer.jobs'), url: 'mailto:jobs@vapor.codes' }
                ]
            }
        }
    };
</script>
