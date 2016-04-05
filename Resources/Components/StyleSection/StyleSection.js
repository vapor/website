export default {
	components: {
		'section-header': require('../SectionHeader/SectionHeader.vue'),
		'big-button': require('../BigButton/BigButton.vue')
	},
	ready() {
		var el = this.$el.querySelector('pre');
		console.log(el)
		
		hljs.highlightBlock(el);
	}
}