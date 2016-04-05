export default {
	props: [
		'href'
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