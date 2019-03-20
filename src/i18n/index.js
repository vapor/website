import Vue from 'vue';
import VueI18n from 'vue-i18n';

// to add new translations, just copy a translation file and fill in the new language's translations
// then import the file and add it to the 'translations' const as seen below

import da from './da';
import de from './de';
import en from './en';
import es from './es';
import uk from './uk';
import ru from './ru';
import fr from './fr';
import zh from './zh';

const translations = {
    da,
    de,
    en,
    es,
    uk,
    ru,
    fr,
    zh
};

Vue.use(VueI18n);

const language = window.navigator.language.split('-')[0];

export default new VueI18n({
    locale: language,
    fallbackLocale: 'en',
    messages: translations
});
