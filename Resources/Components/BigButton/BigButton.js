export default {
	props: [
		'href',
		'icon'
	],
	methods: {
		log(message) {
			this.$root.log('[Big Button] ' + message)
		},
		click() {
			window.location.href = 'http://docs.vapor.codes';
		}
	},
	ready() {
		this.log('Ready')
	}
}