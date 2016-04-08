var Vue = require('vue')
var $ = require('jquery')

new Vue({
	el: 'body',
	components: {
		'splash': require('./Splash/Splash.vue'),
		'style-section': require('./StyleSection/StyleSection.vue'),
		'safety-section': require('./SafetySection/SafetySection.vue'),
		'speed-section': require('./SpeedSection/SpeedSection.vue')
	},
	methods: {
		log: function(message) {
			console.log('[Vapor Website] ' + message);
		}
	},
	ready() {
		var userAgent = navigator.userAgent.toLowerCase(); 
		if (userAgent.indexOf('safari') != -1 && userAgent.indexOf('chrome') == -1) {
			$('body').addClass('safari')
		}
	}
})
