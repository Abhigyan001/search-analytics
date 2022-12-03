import { Controller } from "@hotwired/stimulus"

class extends Controller {
  static targets = [ "form" ]

  querySearch() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 200)
  }
}

export default Controller
