var $ = require('jquery')

export default {
    components: {
    },
    methods: {
        showHint(el, hint) {
            console.log(el)

            var tooltip = document.createElement('span');
            tooltip.innerHTML = hint

            var rect = el.getBoundingClientRect()
            var top = rect.top
            var left = rect.left
            console.log(top, left)

            tooltip.style.position = 'absolute'
            tooltip.style.top = '50px'
            tooltip.style.left = '50px'

            console.log(el)

            el.appendChild(tooltip)

            return tooltip
        },
    },
    ready() {
        var block = this

        var el = this.$el.querySelector('pre');
        hljs.highlightBlock(el);

        $(this.$el).find('.code-hint').on('mouseover', event => {
            var $el = $(event.target)
            var hint = $el.attr('data-title')

            var tooltip = $('<span>')
            tooltip.addClass('tooltip')
            tooltip.text(hint)

            $el.append(tooltip)

            setTimeout(() => {
                tooltip.addClass('show')
            }, 5)
        }).on('mouseleave', event => {
            var $el = $(event.target)
            var tooltip = $el.find('.tooltip')
            tooltip.removeClass('show')
            setTimeout(() => {
                tooltip.remove()
            }, 500)
        })
    }
}