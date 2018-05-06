<template>
    <section class="vapor-terminal">
        <div class="vapor-terminal__stoplight-container">
            <div class="vapor-terminal__stoplight"
                 v-for="color in lights"
                 :class="color"></div>
        </div>

        <pre class="vapor-terminal__sample-code" v-html="sampleCode"></pre>
    </section>
</template>

<style lang="scss">
    @import 'src/variables';
    @import 'src/mixins';

    .vapor-terminal {
        background: black;
        width: 45em;
        max-width: 85%;
        padding: 1em;
        border-radius: 1em;

        .vapor-terminal__stoplight-container {
            .vapor-terminal__stoplight {
                display: inline-block;
                width: 1.5em;
                height: 1.5em;
                border-radius: 1em;

                &.red {
                    background: $color-red;
                }
                &.yellow {
                    background: $color-yellow;
                }
                &.green {
                    background: $color-green;
                }
            }

            .vapor-terminal__stoplight + .vapor-terminal__stoplight {
                margin-left: .75em;
            }
        }

        .vapor-terminal__sample-code {
            color: white;
            font-size: large;
            font-weight: 500;
            font-family: 'Roboto Mono', monospace;
            padding: 0 .75em;

            & .keyword {
                color: $color-code-keyword;
            }

            & .type {
                color: $color-code-type;
            }

            & .method {
                color: $color-code-method;
            }

            & .string {
                color: $color-code-string;
            }
        }
    }

    @include respond-to(phone) {
        .vapor-terminal {
            max-width: 90%;

            .vapor-terminal__stoplight {
                width: 1em !important;
                height: 1em !important;
            }

            .vapor-terminal__stoplight + .vapor-terminal__stoplight {
                margin-left: .5em !important;
            }

            .vapor-terminal__sample-code {
                font-size: x-small;
                padding: 0;
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-terminal {
            .vapor-terminal__stoplight {
                width: 1.25em !important;
                height: 1.25em !important;
            }

            .vapor-terminal__stoplight + .vapor-terminal__stoplight {
                margin-left: .6em !important;
            }
        }
    }
</style>

<script>
    class KEYWORDS {
        static get LET() {
            return this._generateHTML('let');
        }

        static get TRY() {
            return this._generateHTML('try');
        }

        static get SELF() {
            return this._generateHTML('self');
        }

        static get IN() {
            return this._generateHTML('in');
        }

        static get RETURN() {
            return this._generateHTML('return');
        }

        static _generateHTML(text) {
            return `<span class="keyword">${text}</span>`;
        }
    }

    export default {
        name: 'vaporTerminal',
        data () {
            return {
                lights: ['red', 'yellow', 'green']
            }
        },
        computed: {
            sampleCode() {
                return `
${KEYWORDS.LET} Vapor

${KEYWORDS.LET} app = ${KEYWORDS.TRY} ${this.type('Application')}()
${KEYWORDS.LET} router = ${KEYWORDS.TRY} app.${this.method('make')}(${this.type('Router')}.${KEYWORDS.SELF})

router.${this.method('get')}(${this.string('"hello"')}) { req ${KEYWORDS.IN}
    ${KEYWORDS.RETURN} ${this.string('"Hello, world."')}
}

${KEYWORDS.TRY} app.${this.method('run')}()
                `;
            }
        },
        methods: {
            method(text) {
                return this._generateHTML('method', text);
            },
            type(text) {
                return this._generateHTML('type', text);
            },
            string(text) {
                return this._generateHTML('string', text);
            },
            _generateHTML(className, text) {
                return `<span class="${className}">${text}</span>`;
            }
        }
    }
</script>
