import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'pop' ]

  decline() {
    this.popTarget.classList.add('declined')
  }

  accept(){
    this.popTarget.classList.add('accepted')
  }
}