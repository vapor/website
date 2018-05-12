<template>
    <section class="vapor-packages">
        <h3 class="vapor-packages__title">Packages</h3>

        <div class="vapor-packages__container">
            <div class="vapor-packages__column-container"
                 v-for="repo in packageRepos">
                <a class="vapor-packages__repo-link"
                   :href="`https://github.com/vapor/${repo.toLowerCase()}`"
                   target="_blank">{{ repo }}</a>
            </div>
        </div>
    </section>
</template>

<style lang="scss">
    @import 'src/variables';
    @import 'src/mixins';

    .vapor-packages {
        font-weight: 700;
        color: white;
        background-color: $color-apple-dark-gray;
        text-align: center;

        .vapor-packages__title {
            font-size: 2.25em;
        }

        .vapor-packages__container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .vapor-packages__column-container {
            width: 33%;
        }

        .vapor-packages__repo-link {
            display: inline-flex;
            font-size: larger;
            color: inherit;
            width: 9em;
            margin-top: 2em;
            line-height: 1.75em;
            text-decoration: none;

            &::before {
                content: url('assets/check.svg');
                margin-right: 1em;
                height: 1em;
                user-select: none;
            }
        }
    }

    @include respond-to(phone) {
        .vapor-packages {
            .vapor-packages__title {
                font-size: x-large;
            }

            .vapor-packages__repo-link {
                font-size: medium;
                line-height: 2em;

                &::before {
                    margin-right: .5em;
                }
            }
        }
    }

    @include respond-to(tablet) {
        .vapor-packages {
            .vapor-packages__column-container {
                width: 40%;
            }
        }
    }
</style>

<script>
    export default {
        name: 'vaporPackages',
        data () { 
            return {
                packageRepos: [
                    'HTTP', 'WebSocket', 'Crypto', 'Redis',
                    'MySQL', 'PostgreSQL', 'SQLite', 'Fluent',
                    'JWT', 'Leaf', 'Service', 'Auth'
                ]
            }
        }
    }
</script>
