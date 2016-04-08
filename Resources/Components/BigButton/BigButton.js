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
			window.location.href = 'https://github.com/qutheory/vapor/wiki/Setup';
		}
	},
	ready() {
		this.log('Ready')
	}
}