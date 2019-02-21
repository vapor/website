import Vue from 'vue';
import VueI18n from 'vue-i18n';

// to add new translations, just copy a translation file and fill in the new language's translations
// then import the file and add it to the 'translations' const as seen below

import en from './en';

const translations = {
    en
};

Vue.use(VueI18n);

const language = window.navigator.language.split('-')[0];

export default new VueI18n({
    locale: language,
    messages: translations
});
