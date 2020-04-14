class Notify {
  error(title, message) {
    this.push({
      type: 'error',
      title: title,
      message: message
    })
  }

  info(title, message) {
    this.push({
      type: 'info',
      title: title,
      message: message
    })
  }

  warn(title, message) {
    this.push({
      type: 'warning',
      title: title,
      message: message
    })
  }
}

export default new Notify()
