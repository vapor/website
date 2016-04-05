var Vue = require('vue')

new Vue({
	el: 'body',
	components: {
		'splash': require('./Splash/Splash.vue')
	},
	methods: {
		log: function(message) {
			console.log('[Vapor Website] ' + message);
		}
	}})
