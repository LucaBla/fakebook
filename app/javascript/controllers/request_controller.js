import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'pop', 'buttons' ]

  decline() {
    this.popTarget.classList.add('declined')
    this.buttonsTarget.classList.add('hidden')
  }

  accept(){
    this.popTarget.classList.add('accepted')
    this.buttonsTarget.classList.add('hidden')
  }
}