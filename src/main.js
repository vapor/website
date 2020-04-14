import vue from 'vue'
import root from './root.vue'
import router from './router'
import usersAPI  from '@/users-api'
import notify from '@/notify'
import vaporButton from '@/components/vapor-button'
import vaporForm from '@/components/vapor-form'
import vaporInput from '@/components/vapor-input'
import vaporLoadingBar from '@/components/vapor-loading-bar'
import vaporMenu from '@/components/vapor-menu'

vue.component('vapor-button', vaporButton)
vue.component('vapor-form', vaporForm)
vue.component('vapor-input', vaporInput)
vue.component('vapor-loading-bar', vaporLoadingBar)
vue.component('vapor-menu', vaporMenu)

vue.config.productionTip = false
vue.prototype.$api = {
  users: usersAPI
}
vue.prototype.$notify = notify

// This variable will hold the reference to
// document's click handler
let handleOutsideClick

vue.directive('closable', {
  bind (el, binding, vnode) {
    // Here's the click/touchstart handler
    // (it is registered below)
    handleOutsideClick = (e) => {
      e.stopPropagation()
      // Get the handler method name and the exclude array
      // from the object used in v-closable
      const { handler, exclude } = binding.value

      // This variable indicates if the clicked element is excluded
      let clickedOnExcludedEl = false
      exclude.forEach(refName => {
        // We only run this code if we haven't detected
        // any excluded element yet
        if (!clickedOnExcludedEl) {
          // Get the element using the reference name
          const excludedEl = vnode.context.$refs[refName]
          // See if this excluded element
          // is the same element the user just clicked on
          clickedOnExcludedEl = excludedEl.contains(e.target)
        }
      })

      // We check to see if the clicked element is not
      // the dialog element and not excluded
      if (!el.contains(e.target) && !clickedOnExcludedEl) {
        // If the clicked element is outside the dialog
        // and not the button, then call the outside-click handler
        // from the same component this directive is used in
        vnode.context[handler]()
      }
    }
    // Register click/touchstart event listeners on the whole page
    document.addEventListener('click', handleOutsideClick)
    document.addEventListener('touchstart', handleOutsideClick)
  },

  unbind () {
    // If the element that has v-closable is removed, then
    // unbind click/touchstart listeners from the whole page
    document.removeEventListener('click', handleOutsideClick)
    document.removeEventListener('touchstart', handleOutsideClick)
  }
})

vue.config.errorHandler = (err, vm, info) => {
  vm.$notify.error('Error', err.message)
  vm.$notify.loading.stop()
};

new vue({
  router, render: (h) => h(root)
}).$mount('#root')
