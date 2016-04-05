export default {
	props: [
		'href',
		'icon'
	],
	methods: {
		log(message) {
			this.$root.log('[Big Button] ' + message)
		}
	},
	ready() {
		this.log('Ready')
	}
}