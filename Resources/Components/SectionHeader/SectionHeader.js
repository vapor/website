export default {
	props: [
		'title',
		'text'
	],
	ready() {
		this.$el.innerHTML = this.$el.innerHTML.replace('|', '<br>')
	}
}