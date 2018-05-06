<template>
    <section class="vapor-packages">
        <h3 class="vapor-packages__title">Packages</h3>

        <ul class="vapor-packages__list">
            <li class="vapor-packages__list-item"
                v-for="repo in packageRepos">
                <a class="vapor-packages__repo-link"
                   :href="`https://github.com/vapor/${repo.toLowerCase()}`"
                   target="_blank">{{ repo }}</a>
            </li>
        </ul>
    </section>
</template>

<style lang="scss">
    .vapor-packages {
        font-weight: 700;
        color: white;
        background-color: black;
        width: 100%;
        padding: 0 20%;
        text-align: center;

        .vapor-packages__title {
            font-size: 2.25em;
        }

        .vapor-packages__list {
            margin: 0 auto;
            padding: 0;
        }

        .vapor-packages__list-item {
            display: inline-block;
            width: 33%;
            margin-top: 2em;
            text-align: left;
        }

        .vapor-packages__repo-link {
            display: inline-flex;
            font-size: larger;
            color: inherit;
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
