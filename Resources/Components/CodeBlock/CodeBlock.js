var $ = require('jquery')

export default {
    data() {
        return {
            tooltip: null
        }
    },
    components: {
    },
    computed: {
        $() {
            return $(this.$el)
        },
    },
    methods: {
        showHint(el, hint) {
            this.tooltip.text(hint)

            var rect = el.getBoundingClientRect()
            var top = rect.top
            var left = rect.left

            //tooltip.style.position = 'absolute'
            tooltip.style.top = '50px'
            tooltip.style.left = '50px'

            return tooltip
        },
        center(el) {
            var offset = el.offset()

            var width = el.width()
            var height = el.height()

            var parent = {left: 0, top: 0} //this.$.offset()

            var centerX = (offset.left - parent.left) + width / 2;
            var centerY = (offset.top - parent.top) + height / 2;

            return {
                x: centerX,
                y: centerY
            }
        }
    },
    ready() {
        var block = this

        this.tooltip = $('body').find('div.tooltip')
        if (this.tooltip.length == 0) {
            this.tooltip = $('<div class="tooltip">')
            $('body').append(this.tooltip)
        }

        var el = this.$el.querySelector('pre');
        hljs.highlightBlock(el);

        window.tooltipTimeout = null;

        $(this.$el).find('.code-hint').on('mouseover', event => {
            clearTimeout(window.tooltipTimeout)

            var $el = $(event.target)
            var hint = $el.attr('data-title')

            var center = block.center($el)

            block.tooltip.text(hint)

            block.tooltip.css({
                top: center.y + 20 + 'px',
                left: center.x + 'px'
            })

            setTimeout(() => {
                block.tooltip.addClass('show')
            }, 5)
        }).on('mouseleave', event => {
            var $el = $(event.target)

            window.tooltipTimeout = setTimeout(() => {
                block.tooltip.removeClass('show')
            }, 3 * 100)
        })
    }
}