import Vue from 'vue';
import App from './app.vue';

import i18n from './i18n';

new Vue({
    i18n,
    el: '#app',
    render: h => h(App),
    components: {}
});
